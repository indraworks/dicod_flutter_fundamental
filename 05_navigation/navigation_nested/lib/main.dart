import 'package:flutter/material.dart';
import 'package:navigation_nested/loadwidgets/myappnamedroute.dart';

void main() {
  //kalau mau panggil salah satu
  //maka yg lain wajib di comment pilihan yg biasa atau nested
  runApp(Myappnamedroute());
}



/*
pada kali ini adalah demo 
denga namedRoute nah utk function2 routingnya 
class Stateless widgetnya ini atau class yg tempat awal screen /routing  kita 
taruh di Load dir 
dimana nnti ada file berisi 
1.MyAppNamedRouted 
2.MyAppNamedRautedNested 

NamedRouted ini adalah yg biasa utk routing2 sputar screen tanpa ada nested navigation
                dan disertai navigation param 

NamedRoutedNested ini yg navigation dgn routing2 ada nested navigation dan juga ada param 




*/