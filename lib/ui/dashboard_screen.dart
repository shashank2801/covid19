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
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage('assets/images/corona1.png',),height: 100,),
                    Column(
                      children: [
                        Text("Corona Virus | COVID 19",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Stay Home | Stay Safe",style: TextStyle(fontStyle: FontStyle.italic),)
                      ],
                    ),
                  ],
                ),
            ),
            SizedBox(height:10),
            Divider(height: 5,),
            RaisedButton(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Data())))       
          ],
        ),
      ),
    );
  }
}