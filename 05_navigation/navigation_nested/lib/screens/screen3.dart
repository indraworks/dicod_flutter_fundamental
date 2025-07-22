import 'package:flutter/material.dart';
//ini Screen dengan param

class Screen3 extends StatelessWidget {
  //kita harus buat field yg tampung utk masukan dari param yg ada
  //lwat constructor kita
  final String? name; //saya beri tanda ? dia boleh null ini
  //ini constructornya tanda sama dengan itu adalah default value
  //jika tak ada param yg datang dari luar
  const Screen3({super.key, this.name = 'indra'}); //shorhand
  //bisa ditulis seprti ini :
  //const Screen3({Key?:key,this.name= 'Guest'}):super(Key:key);
  //jadi jika tak ada alue di param

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen ')),
      body: Center(child: Text("Hello , How Are you $name?")),
    );
  }
}
