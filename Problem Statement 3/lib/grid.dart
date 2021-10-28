import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grid/paper.dart';
import 'package:grid/pen.dart';


// ignore: must_be_immutable
class lol extends StatelessWidget {
  List data = [
    {"color": Color(0xffe53935)},
    {"color": Color(0xff96da45)},
    {"color": Color(0xff7a54ff)},
    {"color": Color(0xff2ac3ff)},
    {"color": Color(0xffe53935)},
    {"color": Color(0xff96da45)},
  ];

  List data1 = [
    {"event": "pen"},
    {"event": "paper"},
    {"event": "pen"},
    {"event": "paper"},
    {"event": "pen"},
    {"event": "paper"},
    
  ];
  List icons = [
    {"icon": Icons.event},
    {"icon": Icons.people},
    {"icon": Icons.people},
    {"icon": Icons.help},
    {"icon": Icons.people},
    {"icon": Icons.help},
  ];
  List events = [
    {"event": pen()},
    {"event": paper()},
    {"event": pen()},
    {"event": paper()},
    {"event": pen()},
    {"event": paper()},
  ];
  final colorwhite = Colors.white;
  

  @override
  Widget build(BuildContext context) {
    // checkUser(context);
    //  print("===>yes1");
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'Click Sign Out button to Log off your account',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      },
      child: Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
           title:Text("Task 3")  ,
          backgroundColor: Colors.blue,
          elevation: 0,
          actions: [
            // ignore: deprecated_member_use
            
          ],
          
        ),

        body: Stack(
          children: <Widget>[
            

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                    ),
                    
                    Expanded(
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: .1,
                          mainAxisSpacing: 10,
                          // crossAxisSpacing: 10
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 0.5),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(

                                      //passing values to prod
                                      builder: (context) =>
                                          events[index]["event"])),
                              child: Card(
                                color: data[index]["color"],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "        ",
                                            style: TextStyle(
                                                color: colorwhite,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.38)),
                                            child: Icon(
                                              icons[index]["icon"],
                                              color: colorwhite,
                                              size: 24,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 5),
                                          child: Text(
                                            data1[index]["event"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: colorwhite,
                                            ),
                                          )),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.only(right: 10),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
