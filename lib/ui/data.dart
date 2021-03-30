import 'dart:convert';

import 'package:Covid19/util/state_list.dart';
import 'package:Covid19/util/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  Future stateObject;

  String active = '', recovered = '', deceased = '', confirmed = '';

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
            SizedBox(
              height: (MediaQuery.of(context).size.shortestSide < 700 &&
                      MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                  ? MediaQuery.of(context).size.height * .02
                  : MediaQuery.of(context).size.height * .01,
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Covid 19",
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "District Wise \n Statistics",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                Hero(
                  tag: 'Corona',
                  child: Image(
                    image: AssetImage('images/corona1.png'),
                    height: 275.0,
                    width: 180.0,
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _dropDownButton(),
                  SizedBox(
                    height: (MediaQuery.of(context).size.shortestSide < 700 &&
                            MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                        ? MediaQuery.of(context).size.height * .02
                        : MediaQuery.of(context).size.height * .05,
                  ),
                  _textfield(),
                  SizedBox(
                    height: (MediaQuery.of(context).size.shortestSide < 700 &&
                            MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                        ? MediaQuery.of(context).size.height * .02
                        : MediaQuery.of(context).size.height * .05,
                  ),
                ],
              ),
            ),
            Container(
              child: FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Showing Latest Data for City: "),
                          Text(
                            "$city1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.shortestSide <
                                        700 &&
                                    MediaQuery.of(context).orientation ==
                                        Orientation.portrait)
                                ? MediaQuery.of(context).size.height * .03
                                : MediaQuery.of(context).size.height * .05,
                          ),
                          (MediaQuery.of(context).size.shortestSide < 700 &&
                                  MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DetailCard(
                                          title: "Confirmed",
                                          number: snapshot.data['$state1']
                                                  ['districtData']['$city1']
                                                  ['confirmed']
                                              .toString(),
                                          color1: Colors.yellow[300],
                                          color2: Colors.yellow[500],
                                          width: 0.35,
                                          height: 0.15,
                                        ),
                                        DetailCard(
                                          title: 'Active',
                                          number: snapshot.data['$state1']
                                                  ['districtData']['$city1']
                                                  ['active']
                                              .toString(),
                                          color1: Colors.blue[200],
                                          color2: Colors.blue[500],
                                          width: 0.35,
                                          height: 0.15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: (MediaQuery.of(context)
                                                      .size
                                                      .shortestSide <
                                                  700 &&
                                              MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait)
                                          ? MediaQuery.of(context).size.height *
                                              .02
                                          : MediaQuery.of(context).size.height *
                                              .1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DetailCard(
                                          title: "Recovered",
                                          number: snapshot.data['$state1']
                                                  ['districtData']['$city1']
                                                  ['recovered']
                                              .toString(),
                                          color1: Colors.green[200],
                                          color2: Colors.green[500],
                                          width: 0.35,
                                          height: 0.15,
                                        ),
                                        DetailCard(
                                          title: 'Deceased',
                                          number: snapshot.data['$state1']
                                                  ['districtData']['$city1']
                                                  ['deceased']
                                              .toString(),
                                          color1: Colors.red[200],
                                          color2: Colors.red[500],
                                          width: 0.35,
                                          height: 0.15,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DetailCard(
                                      title: "Confirmed",
                                      number: snapshot.data['$state1']
                                              ['districtData']['$city1']
                                              ['confirmed']
                                          .toString(),
                                      color1: Colors.yellow[200],
                                      color2: Colors.yellow[500],
                                      height: 0.25,
                                      width: 0.23,
                                    ),
                                    DetailCard(
                                      title: 'Active',
                                      number: snapshot.data['$state1']
                                              ['districtData']['$city1']
                                              ['active']
                                          .toString(),
                                      color1: Colors.blue[200],
                                      color2: Colors.blue[500],
                                      height: 0.25,
                                      width: 0.23,
                                    ),
                                    DetailCard(
                                      title: "Recovered",
                                      number: snapshot.data['$state1']
                                              ['districtData']['$city1']
                                              ['recovered']
                                          .toString(),
                                      color1: Colors.green[200],
                                      color2: Colors.green[500],
                                      height: 0.25,
                                      width: 0.23,
                                    ),
                                    DetailCard(
                                      title: 'Deceased',
                                      number: snapshot.data['$state1']
                                              ['districtData']['$city1']
                                              ['deceased']
                                          .toString(),
                                      color1: Colors.red[200],
                                      color2: Colors.red[500],
                                      height: 0.25,
                                      width: 0.23,
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.shortestSide <
                                        700 &&
                                    MediaQuery.of(context).orientation ==
                                        Orientation.portrait)
                                ? MediaQuery.of(context).size.height * .02
                                : MediaQuery.of(context).size.width * .01,
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textfield() {
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
        onSubmitted: (value) {
          setState(() {
            value = toBeginningOfSentenceCase(value);
            state1 = dropdownValue;
            city1 = value;
          });
        });
  }

  Widget _dropDownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 10,
      hint: Text('Select State'),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: states.map((state) {
        return DropdownMenuItem(
          child: Text(state),
          value: state,
        );
      }).toList(),
    );
  }
}

Future getData() async {
  var data;
  String url = "https://api.covid19india.org/state_district_wise.json";
  Network network = Network(url);

  data = network.loadPayload();

  return data;
}

class Network {
  final String url;

  Network(this.url);

  Future<dynamic> loadPayload() async {
    var URI = Uri.parse(url);
    http.Response response = await http.get(URI);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      print('Failed Loading');
    }
  }
}
