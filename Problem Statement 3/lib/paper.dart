import 'package:flutter/material.dart';  
  

class paper extends StatelessWidget {  
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
          title:Text("paper")  
      ),  
      body: Center(  
          child:Text("I am paper")  
      ),  
    );  
  }  
}  