import 'package:flutter/material.dart';
import 'package:new_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async{
    WorldTime instance = WorldTime(url: 'Europe/London', flag: 'uk.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.url,
      'time': instance.time,
      'date': instance.date,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SpinKitPulsingGrid(
              color: Colors.black87,
              size: 50.0,
            )
        ),
      ),
    );
  }
}

