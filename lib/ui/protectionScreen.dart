import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Text("Prevention",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                children: [
                  prevCard("4199664-1.jpg", context),
                  prevCard("4199664-2.jpg", context),
                ],
              ),
              Row(
                children: [
                  prevCard("4199664-4.jpg", context),
                  prevCard("4199664-3.jpg", context),
                ],
              ),
              Row(
                children: [
                  prevCard("4199664-5.jpg", context),
                  prevCard("4199664-6.jpg", context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget prevCard(String imgsrc, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,12,0,15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Image(
          image: AssetImage('images/$imgsrc'),
          height: MediaQuery.of(context).size.height * .20,
        ),
      ),
    );
  }
}
