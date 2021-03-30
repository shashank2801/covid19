import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color1;
  final Color color2;
  final double height;
  final double width;

  const DetailCard(
      {Key key,
      @required this.title,
      @required this.number,
      @required this.color1,
      @required this.color2,
      @required this.height,
      @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      //margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$title",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: (MediaQuery.of(context).size.shortestSide < 700 &&
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                      ? MediaQuery.of(context).size.height * 0.02
                      : MediaQuery.of(context).size.width * 0.02)),
          Text(
            "$number",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
