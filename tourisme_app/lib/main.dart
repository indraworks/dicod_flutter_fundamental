import 'package:flutter/material.dart';
import 'package:tourisme_app/data/tourism_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "FLutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tourism List"),
        
        ),
        body: ListView.builder(
          itemCount: tourismList.length,
          //kalau builder selalu pakai context,index utk petakan dia ada dimana si widtet ini 
          itemBuilder: ((context,index){
            return Padding(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            ),)
          }),
      ),
    );
  }
}
