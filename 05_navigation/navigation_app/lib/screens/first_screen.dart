import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Navigation & Routing')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //childrennya yg docloumn ada 4 Button compomnent ( type datanya adalah WIdget)
            ElevatedButton(onPressed: () {}, child: Text('Goto Second Screen')),
            
          ],
        ),
      ),
    );
  }
}
