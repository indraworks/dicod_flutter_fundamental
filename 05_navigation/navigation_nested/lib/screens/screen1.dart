import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Home Screen")),
      body: Column(
        children: [
          //childrennya ada 2 arahke ,scr2,scr3 dgn param
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Go to Second'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/third',
                arguments: {'named': 'Indra'},
              );
            },
            child: Text('Goto Third'),
          ),
        ],
      ),
    );
  }
}
