import 'package:flutter/material.dart';
import 'package:new_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    
    Navigator.pop(context, {
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
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 0.1,
        ),
        body: ListView.builder(
            itemCount: locations.length,
          itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].url,),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
          },
        )
      ),
    );
  }
}
