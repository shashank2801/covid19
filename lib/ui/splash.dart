import 'dart:async';
import 'package:Covid19/ui/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class Splash extends StatefulWidget{
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  void initState(){
    super.initState();

    //animator
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);

    animation = Tween<double>(begin: 0, end: 200).animate(controller)..addListener(() {
         setState((){});
       });

    controller.forward();

    //splashscreen 
    Timer(Duration(seconds: 2),
            ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Data())) //route to next page
            );
  }

  Widget build(BuildContext context){
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/corona1.png'), //image
                        height: animation.value,
                        width: animation.value,
                        
                        ),
                        SizedBox(height: 40),
                        Text("Corona Virus | COVID-19"),
                    ], 
                    ),
                ) 
              )
            ],
          )
        ],
      ),
    );
  }
}