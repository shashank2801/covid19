import 'package:Covid19/util/prevCard.dart';
import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Prevention",
                style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.shortestSide < 700 &&
                            MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                        ? MediaQuery.of(context).size.height * 0.02
                        : MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              (MediaQuery.of(context).orientation == Orientation.landscape ||
                      MediaQuery.of(context).size.longestSide > 1200)
                  ? viewLandscape()
                  : viewPortrait()
            ],
          ),
        ),
      ),
    );
  }
}

class viewPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * .20;
    return Column(
      children: [
        Row(
          children: [
            prevCard(img:"4199664-1.jpg",size:size),
            prevCard(img:"4199664-2.jpg",size:size),
          ],
        ),
        Row(
          children: [
            prevCard(img:"4199664-4.jpg",size:size),
            prevCard(img:"4199664-3.jpg",size:size),
          ],
        ),
        Row(
          children: [
            prevCard(img:"4199664-5.jpg",size:size),
            prevCard(img:"4199664-6.jpg",size:size),
          ],
        ),
      ],
    );
  }
}

class viewLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * .25;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Row(
        children: [
              prevCard(img:"4199664-1.jpg", size:size),
              prevCard(img:"4199664-2.jpg", size:size),
          prevCard(img:"4199664-4.jpg",size:size),
          prevCard(img:"4199664-3.jpg",size:size),
          prevCard(img:"4199664-5.jpg",size:size),
          prevCard(img:"4199664-6.jpg",size:size),
        ],
      ),
    );
  }
}

