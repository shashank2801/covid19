import 'dart:convert';

import 'package:Covid19/ui/services_list.dart';
import 'package:Covid19/ui/state_list.dart';
import 'package:flutter/material.dart';
import 'package:Covid19/model/covid.dart';
//import 'package:Covid19/network/network.dart';
import 'package:http/http.dart';

class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  String dropdownValue;
  String city;
  String service;
  Future resources;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resources = getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              _statesDropDownButton(),
              _textfield(),
              _servicesDropDownButton(),
              Center(
                child: FlatButton(onPressed: null, child: null),
              ),
              FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.resources.length,
                    itemBuilder:(context,index)=> _Card(),
                    );
                }
                else
                {
                  return CircularProgressIndicator();
                }
              },
        ),
            ],
          ),
      ),
      
    );
  }

  Widget _Card({String city, String state, String category, String name, String description, String number}){
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("$title"),
                                Text("$number"),
                              ],
                            ),,
    );
  }

  Widget _statesDropDownButton(){
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
                            city = value;
                          });
                        }
                     );
      }

  Widget _servicesDropDownButton(){
    return DropdownButton<String>(
                value: service,
                elevation: 10,
                
                hint: Text('Choose Type'),
                onChanged: (String newValue){
                  setState(() {
                    service = newValue;
                  });
                },
                items: services.map((type){
                  return DropdownMenuItem(child: Text(type),value: type,);
                }).toList(), 
              );
    }
  
}

Future getData(){
  var data;
  String url = "https://api.covid19india.org/resources/resources.json";
  Network network = Network(url);

  data = network.getModel();

  return data;
}

class Network{

  final String url;

  Network(this.url);


  Future<dynamic> getModel() async{ 

    final response = await get(Uri.decodeFull(url));

    if(response.statusCode == 200){

      return json.decode(response.body);
    }
    else{
      print('Failed Loading');
    }

  }  
}