import 'package:flutter/material.dart';
import 'package:tourisme_app/data/tourism_data.dart';
import 'package:tourisme_app/models/tourism.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Demo ",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Tourist List")),

        body: ListView.builder(
          itemCount: tourismList.length,
          itemBuilder: (context, index) {
            final tourism = tourismList[index];
            //kmbalian List  ada padding
            //asalanya padding kita ctrl +. ectract medhod pilih nama TourismCard

            return TourismCard(tourism: tourism);
          },
        ),
      ),
    );
  }
}

class TourismCard extends StatelessWidget {
  const TourismCard({super.key, required this.tourism});

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(tourism.name, style: TextStyle(fontSize: 16)),
          Text(
            tourism.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
