import 'dart:convert';
import 'package:Covid19/model/covid.dart';
import 'package:http/http.dart';

class Network{

  Future<resource> getModel() async{
    String url = "https://api.covid19india.org/resources/resources.json";

    final response = await get(Uri.decodeFull(url));

    if(response.statusCode == 200){

      return json.decode(response.body);
    }
    else{
      print('Failed Loading');
    }

  }  
}