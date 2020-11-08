import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text("Prevention"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 1; i <= 6; i++)
                      prevCard("4199664-$i.jpg", context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget prevCard(String imgsrc, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image(
            image: AssetImage('images/$imgsrc'),
            height: MediaQuery.of(context).size.height * .20,
          ),
        ),
      ),
    );
  }
}
