import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location for the UI
  String timeLtst = ''; //Time for that location

  String flag; //Url for the location in asset flag icon
  String url; //for the api endpoint the url of location
  bool dayTime = true; // Set if day time

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      // Going to make the request
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map timeData = jsonDecode(response.body);
      //getting the time data properties
      String dateTime = timeData['datetime'];
      String utcOffset = timeData['utc_offset'].substring(1, 3);
      //Now creating the dateTime object
      DateTime time =
          DateTime.parse(dateTime).add(Duration(hours: int.parse(utcOffset)));

      //saving the time property
      dayTime = time.hour > 6 && time.hour < 20 ? true : false;
      timeLtst = DateFormat.jm().format(time);
    } catch (except) {
      print('Error: $except');
      timeLtst = 'Failed to get the Time Data';

      print(url);
      print(location);
      print(flag);
      print('The error: $except ');
    }
  }
}
