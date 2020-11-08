import 'package:Covid19/ui/data.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
                  child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.3,
                child: Image(image: AssetImage('images/corona2.jpg'),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.045,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage('images/corona1.png',),height: MediaQuery.of(context).size.width*.35,),
                    Column(
                      children: [
                        Text("Stay Home\nStay Safe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)
                      ],
                    ),
                  ],
                ),
              SizedBox(height: MediaQuery.of(context).size.height*0.045,),
              Text("Symptoms:-",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    for(int i=1;i<=6;i++)
                      symptomCard(context,"images/symptoms-$i.jpg"),
                  ]
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.045,),
              RaisedButton(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Data())),child: Text("Click to Continue"),)       
            ],
          ),
      ),
        ),
    );
  }


  Widget symptomCard(BuildContext context, String imgUrl){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        child: Image(image: AssetImage(imgUrl),height: MediaQuery.of(context).size.height*.2,),
        elevation: 14.0,
      ),
    );
  }
}