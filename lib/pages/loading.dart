import 'package:flutter/material.dart';
import 'package:worldweather/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    WorldTime obj = WorldTime(
        location: 'Karachi', flag: 'Pakistan.png', url: 'Asia/Karachi');
    await obj.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.timeLtst,
      'isDaytime': obj.dayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitPouringHourglass(
            color: Colors.white,
            size: 200.0,
          ),
          SizedBox(height: 50.0),
          Text(
            'Loading',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
    );
  }
}
