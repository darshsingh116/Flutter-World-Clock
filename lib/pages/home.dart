import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    print(result);
                    setState(() {
                      data['location'] = result['location'];
                      data['flag'] = result['flag'];
                      data['time'] = result['time'];
                      data['isDay'] = result['isDay'];
                    });

                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit location'),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 2
                    ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
