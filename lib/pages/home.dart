import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    //Set backgrround
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.black : Colors.white;


    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
        decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage('assets/$bgImage'),
               fit: BoxFit.cover
          )
        ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'date': result['date'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  label: Text('Edit Location',),
                  icon: Icon(Icons.location_pin),
                ),
          
                SizedBox(height: 20.0),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: bgColor,
                        fontSize: 28.0,
                        letterSpacing: 2.0
                      ),
                    )
                  ],
                ),
          
                SizedBox(height: 20.0),
          
                Text(data['time'],
                  style: TextStyle(
                    color: bgColor,
                    fontSize: 66.0
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
