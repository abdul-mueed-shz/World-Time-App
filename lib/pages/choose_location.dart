import 'package:flutter/material.dart';
import 'package:worldtime/services/worldTime.dart';

class LocationChoose extends StatefulWidget {
  const LocationChoose({Key? key}) : super(key: key);

  @override
  _LocationChooseState createState() => _LocationChooseState();
}

class _LocationChooseState extends State<LocationChoose> {
  List<WorldTime> countries = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jamaica.png'),
    WorldTime(
        url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudia.png'),
  ];
  void changeTime(index) async {
    WorldTime obj = countries[index];
    await obj.getData();
    //go to Home screen and also pass whatever data we get to home
    Navigator.pop(context, {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.timeLtst,
      'isDaytime': obj.dayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print(' Build InitState Function Ran');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  changeTime(item);
                },
                title: Text(countries[item].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${countries[item].flag}'),
                ),
              ),
            ),
          );
        },
        itemCount: countries.length,
      ),
    );
  }
}
