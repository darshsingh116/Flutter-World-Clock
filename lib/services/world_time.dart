import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  late String location;
  late String time;
  late String flag; //url to an asset of flag icons
  late String url; //location url for api endpoint
  late bool isDay;

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getData() async{
    try{
      //print("hi1");
      //var url = Uri.http('https://jsonplaceholder.typicode.com/todos/1');
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3)), minutes: int.parse(offset.substring(4))));
      //print(int.parse(offset.substring(1,3)));
      //print(int.parse(offset.substring(4)));
      isDay = now.hour > 6 && now.hour <20 ?true : false;

      time = DateFormat.jm().format(now);
    }catch(e){
      time = "Error while contacting server";
    }


  }


}