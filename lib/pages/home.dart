import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Map timeData = {};

  @override
  Widget build(BuildContext context) {
    timeData = timeData.isNotEmpty
        ? timeData
        : ModalRoute.of(context)!.settings.arguments as Map;

    //changing the background
    String backGrd = timeData['isDaytime'] ? 'sun.jpg' : 'forestnight.jpg';

    final txtColor = timeData['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$backGrd'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90.0, 0, 0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic response =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      timeData = {
                        'time': response['time'],
                        'location': response['location'],
                        'isDaytime': response['isDaytime'],
                        'flag': response['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: txtColor,
                  ),
                  label: Text(
                    'Change Location',
                    style: TextStyle(
                      color: txtColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(width: 20.0,),
                    Text(
                      timeData['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 3.0,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  timeData['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                    color: txtColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.cyan[800],
    );
  }
}
