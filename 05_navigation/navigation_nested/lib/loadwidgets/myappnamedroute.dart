import 'package:flutter/material.dart';
//jika import yg ada path maka package:namafile flutter/dir_stlah_lib/filename.dart
import 'package:navigation_nested/screens/screen1.dart';
import 'package:navigation_nested/screens/screen2.dart';
import 'package:navigation_nested/screens/screen3.dart';

class Myappnamedroute extends StatelessWidget {
  const Myappnamedroute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes No Nested Navigation',
      initialRoute: '/',
      routes: {
        '/': (context) => Screen1(),
        '/second': (context) => Screen2(),
        //'/third': (context) => Screen3(), ---->ini gak perlu !
      },
      //INI PUNYA screen third dimana dia tidak dari awal home
      //karena lewat dari screen2 lewat argumwnt atau masukan pkai argument
      onGenerateRoute: (settings) {
        //helo jangan lupa ini pakai slash yg dicari tahu adalah
        //detect routenya !
        if (settings.name == '/third') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            //check jika namenya undeifed atau null maka otomatis hasil
            //yg ditampilkan adalah Guest
            builder: (context) => Screen3(name: args['name'] ?? 'Guest'),
          );
        }
      },
    );
  }
}
