import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';

class HomePage extends StatefulWidget with NavigationStates{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//            icon: Icon(FontAwesomeIcons.arrowLeft),
//            onPressed: () {
//              //
//            }),
//        title: Text("New York"),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(FontAwesomeIcons.search),
//              onPressed: () {
//                //
//              }),
//        ],
//      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
//          _zoomminusfunction(),
//          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
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
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(12.958650, 78.271055), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(12.958650, 78.271055), zoom: zoomVal)));
  }

//12.958650, 78.271055
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
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  12.960785, 78.279121,"Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  12.963004, 78.271833,"Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  12.955610, 78.274101,"Blue Hill"),
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
        height: 50,
        child: new FittedBox(
          child: Material(
              color: Colors.white,
//              elevation: 14.0,
              borderRadius: BorderRadius.circular(25.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 80,
                    color: Colors.amber,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/bike.png'),
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
  Widget _bikeBox() {
    return  GestureDetector(
      onTap: () {
      },
      child:Container(
        height: 50,
        child: new FittedBox(
          child: Material(
              color: Colors.white,
//              elevation: 14.0,
              borderRadius: BorderRadius.circular(25.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 80,
                    color: Colors.amber,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/bike.png'),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
//                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text('Payana Zone',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      " Kolar GoldField #1055",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),
                    )),
//                Container(
//                  child: Icon(
//                    FontAwesomeIcons.solidStar,
//                    color: Colors.amber,
//                    size: 5.0,
//                  ),
//                ),
//                Container(
//                  child: Icon(
//                    FontAwesomeIcons.solidStar,
//                    color: Colors.amber,
//                    size: 5.0,
//                  ),
//                ),
//                Container(
//                  child: Icon(
//                    FontAwesomeIcons.solidStar,
//                    color: Colors.amber,
//                    size: 5.0,
//                  ),
//                ),
//                Container(
//                  child: Icon(
//                    FontAwesomeIcons.solidStar,
//                    color: Colors.amber,
//                    size: 5.0,
//                  ),
//                ),
//                Container(
//                  child: Icon(
//                    FontAwesomeIcons.solidStarHalf,
//                    color: Colors.amber,
//                    size: 5.0,
//                  ),
//                ),
//                Container(
//                    child: Text(
//                      "(946)",
//                      style: TextStyle(
//                        color: Colors.black54,
//                        fontSize: 8.0,
//                      ),
//                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              'Opposite Organic World',
//              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 8.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              '17th Cross Road, 1st Sector, HSR Layout',
//              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 8.0,
              ),
            )),
        SizedBox(height: 5.0,),
        Container(
            child: Text(
              "Tap \u00B7",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:  CameraPosition(target: LatLng(12.958650, 78.271055), zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
          },
        ),
        Positioned(
          top: 30.0,
          right: 15.0,
          left: 15.0,
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.adjust,
                      color: Colors.green,
                    ),
                    onPressed: null,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search),
//                          onPressed: searchandNavigate,
                      iconSize: 30.0)),
              onChanged: (val) {
                setState(() {
//                  searchAddr = val;
                });
              },
            ),
          ),
        ),

      ],
    ));
  }
//    return Container(
//      height: MediaQuery.of(context).size.height,
//      width: MediaQuery.of(context).size.width,
//      child: GoogleMap(
//        mapType: MapType.normal,
//        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
//        onMapCreated: (GoogleMapController controller) {
//          _controller.complete(controller);
//        },
//        markers: {
//          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
//        },
//      ),
//    );


  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(12.960785, 78.279121),
  infoWindow: InfoWindow(title: 'Gramercy Tavern',),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(12.963004, 78.271833),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(12.955610, 78.274101),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);






//import 'dart:async';
//import 'dart:math';
//
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
////https://github.com/iampawan/GDG-DevFest-App
//
//class MyMapPage extends StatefulWidget with NavigationStates {
//  MyMapPage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyMapPageState createState() => _MyMapPageState();
//}
//
//class _MyMapPageState extends State<MyMapPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(body: Maps());
//  }
//}
//
//class Maps extends StatefulWidget {
//  @override
//  _MapsState createState() => _MapsState();
//}
//
//class _MapsState extends State<Maps> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  LatLng _initialPosition = LatLng(13.036176387874256, 77.62050329002098);
//  GoogleMapController _controller;
//  Location _location = Location();
//  String searchAddr;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Stack(
//      children: <Widget>[
//        GoogleMap(
//          initialCameraPosition: CameraPosition(
//            target: _initialPosition,
//            zoom: 10,
//          ),
//          mapType: MapType.normal,
//          onMapCreated: _onMapCreated,
//        ),
//        Positioned(
//          top: 30.0,
//          right: 15.0,
//          left: 15.0,
//          child: Container(
//            height: 50.0,
//            width: double.infinity,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
//            child: TextField(
//              decoration: InputDecoration(
//                  hintText: 'Enter Address',
//                  border: InputBorder.none,
//                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
//                  prefixIcon: IconButton(
//                    icon: Icon(
//                      Icons.adjust,
//                      color: Colors.green,
//                    ),
//                    onPressed: null,
//                  ),
//                  suffixIcon: IconButton(
//                      icon: Icon(Icons.search),
////                          onPressed: searchandNavigate,
//                      iconSize: 30.0)),
//              onChanged: (val) {
//                setState(() {
//                  searchAddr = val;
//                });
//              },
//            ),
//          ),
//        ),
//        Container(
//          child: Align(
//            alignment: FractionalOffset.bottomCenter,
//            child: RaisedButton(
//              onPressed: () {
////                Navigator.pushNamed(context, 'home');
//              },
//              child: Text(
//                'Book a ride',
//                style: TextStyle(color: Colors.white),
//              ),
//              elevation: 10,
//              color: Color.fromRGBO(3, 9, 23, 1),
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(8))),
//            ),
//          ),
//        ),
//      ],
//    ));
//  }
////
////  searchandNavigate() {
////    Geolocator().placemarkFromAddress(searchAddr).then((result) {
////      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
////          target:
////          LatLng(result[0].position.latitude, result[0].position.longitude),
////          zoom: 10.0)));
////    });
////  }
//
//  void _onMapCreated(GoogleMapController controller) {
//    setState(() {
//      _controller = controller;
//      // ignore: unnecessary_statements
//      _location.onLocationChanged.listen((l) {
//        _controller.animateCamera(
//          CameraUpdate.newCameraPosition(
//            CameraPosition(
//              target: LatLng(l.latitude, l.longitude),
//              zoom: 15
//            ),
//          ),
//        );
//      });
//    });
//  }
//}
