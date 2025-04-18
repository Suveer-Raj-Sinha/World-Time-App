import 'package:worldtime/worldtime.dart';
import 'package:intl/intl.dart';

class WorldTime{

  late String flag;
  late String url;
  late String time;
  late String date;
  late bool isDayTime;

  WorldTime({required this.url, required this.flag});

  Future<void> getTime() async{

    try {
      Worldtime object = Worldtime();

      DateTime oldResponse = await object.timeByCity('$url');

      String response1 = oldResponse.toString();

      date = response1.substring(0,11);

      isDayTime = (oldResponse.hour > 6 && oldResponse.hour < 18) ? true : false;
      time = DateFormat.jm().format(oldResponse);

    } on Exception catch (e) {
      time = 'could not get time data';
      date = 'could not get date data';
    }
  }
}