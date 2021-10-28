import 'package:flutter/material.dart';
import 'package:grid/grid.dart';  
  
void main() { runApp(MyApp()); }  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
        theme: ThemeData(  
          primarySwatch: Colors.green,  
        ),  
        home: lol()  
    );  
  }  
}  