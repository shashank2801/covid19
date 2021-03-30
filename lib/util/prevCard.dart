import 'package:flutter/material.dart';

class prevCard extends StatelessWidget {

  final String img;
  final double size;

  const prevCard({Key key, @required this.img,@required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.fromLTRB(15, 12, 0, 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Image(
        image: AssetImage('images/$img'),
        height: size-0.1,
        width: size,
      ),
    ),
  );
  }
}