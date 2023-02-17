import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clocks/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //late String output;

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'some.png', url: 'Asia/Kolkata');
    await instance.getData();
    Navigator.pushReplacementNamed((context), '/home',arguments: {

      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay' : instance.isDay
    });
    //print(instance.time);

    /*setState(() {
      output = instance.time;
    });*/

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();

    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
