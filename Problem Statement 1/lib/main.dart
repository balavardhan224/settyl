import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:parking/screens/page.dart';
// import 'package:parking/screens/page1.dart';
// import 'package:parking/screens/payment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoogleMaps Demo',
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  var movieName;

  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Hyderabad"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
          //_bottom(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:const Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(17.3850, 78.4867), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(17.3850, -78.4867), zoom: zoomVal)));
  }

  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              
              
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  16.74882, 78.0035,"MBNR"),
                  
                  
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              
              
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  17.60012, 78.41868,"IARE"),
                  
                  
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  17.5752, 78.4232,"gandimaisamma"),
                  
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    var solidStar;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Container(
              //     child: const Text(
              //   "4.1",
              //   style: TextStyle(
              //     color: Colors.black54,
              //     fontSize: 18.0,
              //   ),
              // )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              //  Container(
              //     child: Text(
              //   "(946)",
              //   style: TextStyle(
              //     color: Colors.black54,
              //     fontSize: 18.0,
              //   ),
              // )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "        PRESS ME     ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )
              ),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Open",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(17.6351, 78.4022), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // markers: {
        //   newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
          
        // },
        markers: _createMarker(),
        
      ),
      
    );
      
  }
  Set<Marker> _createMarker() {
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
          markerId: MarkerId('home'),
          position: LatLng(17.60012, 78.41868),
          infoWindow: const InfoWindow(
            title: " hi",
            snippet: "tq for pressing",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
          onTap: () {
            showModalBottomSheet(
             // <= set preferable radius.
       
        context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      
         builder: (context)=> _bottom());
         
          }
          ),
          Marker(
          markerId: MarkerId('gandi'),
          position: LatLng(17.5752, 78.4232),
          infoWindow: const InfoWindow(
            title: " hi",
            snippet: "tq for pressing",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
          onTap: () {
  //   Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //   	builder: (context) => _bottom()),
  // );
}
          ),
          Marker(
          markerId: MarkerId('home1'),
          position: LatLng(16.7488, 78.0035),
          infoWindow: const InfoWindow(
            title: " hi",
            snippet: "tq for pressing",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
  ),
          onTap: () {
          }
          )
          
    ].toSet();
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

  _bottom() {
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      maxChildSize: 0.65,
      minChildSize: 0.25,
      builder: (context,scrollController){
        return SingleChildScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Container(
                        width: 44,
                        height: 0.01,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'SCROLL SHEET',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22.4,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              'Hyderabad',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 12,
                                  letterSpacing: 0.2
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.local_parking,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.grey[900],
                                  elevation: 4,
                                ),
                                // SizedBox(width: 4,),
                                // Text(
                                //   '24 spots',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: 12.4
                                //   ),
                                // ),

                                SizedBox(width: 24,),

                                Card(
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.attach_money,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.grey[900],
                                  elevation: 4,
                                ),
                                // SizedBox(width: 4,),
                                // Text(
                                //   '10.44 p/h',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: 12.4
                                //   ),
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0,top: 8),
                        child: ClipRRect(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 110,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 24),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        elevation: 6,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => MyPaymentPage()),
                            // );
                          },
                        color: Colors.black87,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'BUTTON',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 4,
                              letterSpacing: 0.3
                          ),
                        ),
                      ),
                    ),
                  ),




                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Working Hours',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400],
                        fontSize: 12,
                        letterSpacing: 0.2
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      '05:00 AM - 11:00 PM',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 18,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Open Now',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                          fontSize: 12.4,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),



                  SizedBox(height: 38,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Contacts',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 12,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                            Icons.call,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '9381470938',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[900],
                              fontSize: 18,
                              letterSpacing: 0.2
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.web_asset,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'balavardhanrdy@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[900],
                              fontSize: 14.4,
                              letterSpacing: 0.2
                          ),
                        ),
                      ],
                    ),
                  ),





                  SizedBox(height: 44,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Full Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 12,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Hyderabad',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 16.5,
                          letterSpacing: 0.2
                      ),
                    ),
                  ),
                ],
              ),
          ),
        );
      },
    );
  }

  }




class FontAwesomeIcons {
  static IconData? solidStar;

  static IconData? solidStarHalf;

  static IconData? arrowLeft;

  static IconData? search;

  static IconData? searchMinus;

  static IconData? searchPlus;
}


Marker gramercyMarker = Marker(
  markerId: MarkerId('gandi'),
  position: LatLng(17.5752, 78.4232),
  infoWindow: InfoWindow(title: 'gandimaisamma'),
  
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
    
    
  ),
);