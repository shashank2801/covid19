import 'dart:convert';

import 'package:Covid19/ui/state_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:google_fonts/google_fonts.dart';

class Data extends StatefulWidget {
  
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {

 Future stateObject;

  String active='',recovered='',deceased='',confirmed='';

  String dropdownValue;
  String state1 = "Delhi";
  String city1 = "New Delhi";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateObject = getData();

   // stateObject.then((value) =>print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                    SizedBox(height: 30),
                    Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Covid 19",style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold)),),
                          SizedBox(height: 30),
                          Text("District Wise \n Statistics",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),)
                        ],
                      ),
                      Image(image: AssetImage('images/corona1.png'),height: 275.0,width: 180.0,)
                    ],
                  ),
            
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dropDownButton(),
              SizedBox(height: 10,),
              _textfield(),
              ]
          ),
        ),
//          SizedBox(height: 10),
            Container(
              child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, snapshot){

                  if(snapshot.hasData){
                    if(MediaQuery.of(context).size.shortestSide <700 && MediaQuery.of(context).orientation == Orientation.portrait){                
                    //mobile portrait orientation starts
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Text("Showing Latest Data for City: "),
                        Text("$city1",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                        _Card(title:"Confirmed", number: snapshot.data['$state1']['districtData']['$city1']['confirmed'].toString(),color1: Colors.yellow[700], color2: Colors.yellow[300],width: 0.35,height: 0.15),
                        //SizedBox(width: 4),
                        _Card(title: 'Active',number: snapshot.data['$state1']['districtData']['$city1']['active'].toString(),color1: Colors.blue[700], color2: Colors.blue[300],width: 0.35,height: 0.15),
                        ],
                        ),

                        SizedBox(height: 34),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                        _Card(title:"Recovered", number: snapshot.data['$state1']['districtData']['$city1']['recovered'].toString(),color1: Colors.green[700], color2: Colors.green[300],width: 0.35,height: 0.15),
                        //SizedBox(width: 4),
                        _Card(title: 'Deceased',number: snapshot.data['$state1']['districtData']['$city1']['deceased'].toString(),color1: Colors.red[700], color2: Colors.red[300],width: 0.35,height: 0.15),
                        ],
                        ),
                      ],
                    );
                  } //mobile portrait orientation ends
                  else{
                    //other screens
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Showing Latest Data for City: "),
                          Text("$city1",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                            _Card(title:"Confirmed", number: snapshot.data['$state1']['districtData']['$city1']['confirmed'].toString(),color1: Colors.yellow[700], color2: Colors.yellow[300],height: 0.25, width: 0.23),
                            _Card(title: 'Active',number: snapshot.data['$state1']['districtData']['$city1']['active'].toString(),color1: Colors.blue[700], color2: Colors.blue[300],height: 0.25, width: 0.23),
                            _Card(title:"Recovered", number: snapshot.data['$state1']['districtData']['$city1']['recovered'].toString(),color1: Colors.green[700], color2: Colors.green[300],height: 0.25, width: 0.23),
                            _Card(title: 'Deceased',number: snapshot.data['$state1']['districtData']['$city1']['deceased'].toString(),color1: Colors.red[700], color2: Colors.red[300],height: 0.25, width: 0.23),
                            ],
                            ),
                          ),
                        SizedBox(height: 40),
                        ],
                      ),
                    );
                  }
                }
                else if(snapshot.hasError){
                  return AlertDialog(
                    actions: [
                      Text("Alert", style: TextStyle(color: Colors.red, fontSize: 16)),
                      Text("You have entered some wrong details. \n Check that you've entered the right city name.\n Make sure to capitalise first letter")
                    ],
                  );
                }

                  else{
                    return CircularProgressIndicator();
                  }

                }
                ),
              ),
          ],
        ),
      ),
    );
  }


  Widget _textfield(){
  return TextField(
           autocorrect: true,
           decoration: InputDecoration(
                        hintText: "Enter City Name",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                       ),
                        onSubmitted: (value){
                          setState(() {
                            state1 = dropdownValue;
                            city1 = value;
                          });
                        }
                     );
      }

  Widget _Card({String title, String number, Color color1, Color color2, double height, double width}){
    return Container(
                              width: MediaQuery.of(context).size.width*width,
                              height: MediaQuery.of(context).size.height*height,
                              //margin: EdgeInsets.all(50.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [color1,color2],begin: Alignment.topLeft,end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(14.5)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("$title"),
                                Text("$number"),
                              ],
                            ),
                        );
  }

  Widget _dropDownButton(){
    return DropdownButton<String>(
                value: dropdownValue,
                elevation: 10,
                
                hint: Text('Select State'),
                onChanged: (String newValue){
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: states.map((state){
                  return DropdownMenuItem(child: Text(state),value: state,);
                }).toList(), 
              );
    }
}

Future getData() async{
  var data;
  String url = "https://api.covid19india.org/state_district_wise.json";
  Network network = Network(url);

  data = network.loadPayload();

  return data;
}

class Network{

  final String url;

  Network(this.url);

  Future<dynamic> loadPayload() async{
    Response response = await get(Uri.decodeFull(url));

    if(response.statusCode == 200){

      var data = json.decode(response.body);

      return data;
    }
    else{
      print('Failed Loading');
    }

  }  
}

