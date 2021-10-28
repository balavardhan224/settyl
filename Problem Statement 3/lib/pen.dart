import 'package:flutter/material.dart';  
  

class pen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
        theme: ThemeData(  
          primarySwatch: Colors.green,  
        ),  
        home: MyTextPage()  
    );  
  }  
}  
class MyTextPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
          title:Text("pen")  
      ),  
      body: Center(  
          child:Text("I am pen")  
      ),  
    );  
  }  
}  