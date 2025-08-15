import 'package:flutter/material.dart';
//ini Screen dengan param

class Screen3 extends StatelessWidget {
  //kita harus buat field yg tampung utk masukan dari param yg ada
  //lwat constructor kita
  final String name; //saya beri tanda ? dia boleh null ini
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
      //hasil akan selalu Guest karena defaul indra diabaikan karena sudah ada yg datang
      //atau param sudah disi dari luar!
      body: Center(child: Text("Hello , How Are you $name?")),
    );
  }
}
/*

Defaukt constructor  this,name = indra tidak akan pernah ditanpilkan jika dari aawl 
yg dari parent yaitu progam 
on Generate setting itu kita sudah ada argumentnya yaitu guest kecuali dia null 
nah hasil juga tetap null jika null dikirim secara explisit! 

1)args['named'] ?? 'Guest'
Jika args['named'] ada, maka digunakan — dan nilai default constructor = 'indra' akan diabaikan.

2)jika tidak ada dikirim pakai param dari parent prgram utmama
kita matikan langusng ke direct ke screen 3 
Screen3() 
// akan tampil: "Hello , How Are you indra?" ← default constructor dipakai
pasti akan tampil indra karena tidak ada nilai yg masuk (implisit)
*/