import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';

class RideHistory extends StatefulWidget with NavigationStates {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory>{
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 120,
                child: Container(
                    child: Text(
                        "Ride History",
                      style: TextStyle(
                        fontSize: 25
                      ),
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: ListView.builder(
                  itemCount: 19,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Stack(
                        children: <Widget>[
                            Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                            ),
//                          alignment: Alignment.center,
//                      margin: new EdgeInsets.only(top: 30.0, bottom: 5),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: 12,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle, color: Colors.black),
                                      ),
                                      SizedBox(height: 3),
                                      Container(
                                        height: 20,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle, color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "Dec 03, 10:52",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                        "SH 104, Kannuru, Bengaluru,",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey
                                      ),
                                    ),
                                    Text(
                                      "Karnataka.....",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 60,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("₹ 82.0"),
                                    Icon(
                                      Icons.fiber_manual_record,
                                      color: Colors.green,size: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}

//import 'dart:ui' as ui;
//import 'package:flutter/material.dart';
//import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
//import 'package:sidebaranimationflutter/widgets/common_widgets.dart';
//
//class RideHistory extends StatefulWidget with NavigationStates{
//  @override
//  _RideHistoryState createState() => _RideHistoryState();
//}
//
//class _RideHistoryState extends State<RideHistory> {
//  final double _borderRadius = 24;
//
//  var items = [
//    PlaceInfo('March 03 , 1:09 PM    Rs.98', Color(0xff6DC8F3), Color(0xff73A1F9),
//         'Dubai · In The Dubai Mall', 'Cosy · Casual · Good for kids'),
//    PlaceInfo('April 09 , 6:09 PM    Rs.108', Color(0xffFFB157), Color(0xffFFA057),
//        'Sharjah', 'All you can eat · Casual · Groups'),
//    PlaceInfo('may 03 , 1:10 PM    Rs.178', Color(0xffFF5B95), Color(0xffF8556D),
//        'Dubai · Near Dubai Aquarium', 'Casual · Groups'),
//    PlaceInfo('March 03 , 1:09 PM    Rs.98', Color(0xffD76EF5), Color(0xff8F7AFE),
//        'Dubai', 'Casual · Good for kids · Delivery'),
//    PlaceInfo('March 03 , 1:09 PM    Rs.98', Color(0xff42E695), Color(0xff3BB2B8),
//        'Dubai · In BurJuman', '...'),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//        itemCount: items.length,
//        itemBuilder: (context, index) {
//          return Center(
//            child: Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: Stack(
//                children: <Widget>[
//                  Container(
//                    height: 150,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(_borderRadius),
//                      gradient: LinearGradient(colors: [
//                        items[index].startColor,
//                        items[index].endColor
//                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                      boxShadow: [
//                        BoxShadow(
//                          color: items[index].endColor,
//                          blurRadius: 12,
//                          offset: Offset(0, 6),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Positioned(
//                    right: 0,
//                    bottom: 0,
//                    top: 0,
//                    child: CustomPaint(
//                      size: Size(100, 150),
//                      painter: CustomCardShapePainter(_borderRadius,
//                          items[index].startColor, items[index].endColor),
//                    ),
//                  ),
//                  Positioned.fill(
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Padding(
//                            padding: const EdgeInsets.only(top: 28.0),
//                            child: Column(
//                              children: <Widget>[
//                                Container(
//                                  height: 12,
//                                  decoration: BoxDecoration(
//                                    shape: BoxShape.circle,
//                                    color: Colors.black
//                                  ),
//                                ),
//                                SizedBox(height:3),
//                                Container(
//                                  height: 70,
//                                  width: 3,
//                                  decoration: BoxDecoration(
//                                      shape: BoxShape.rectangle,
//                                      color: Colors.white
//                                  ),
//                                ),
//                                Icon(
//                                  Icons.location_on,
//                                  color: Colors.red,
//                                  size: 20,
//                                ),
//                              ],
//                            ),
//                          ),
//                          flex: 2,
//                        ),
//                        Expanded(
//                          flex: 4,
//                          child: Column(
//                            mainAxisSize: MainAxisSize.min,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text(
//                                items[index].name,
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontFamily: 'Avenir',
//                                    fontWeight: FontWeight.w700,
//                                    fontSize: 20
//                                ),
//                              ),
//                              Text(
//                                items[index].category,
//                                style: TextStyle(
//                                  color: Colors.black,
//                                  fontFamily: 'Avenir',
//
//                                ),
//                              ),
//                              SizedBox(height: 16),
//                              Row(
//                                children: <Widget>[
//                                  Icon(
//                                    Icons.location_on,
//                                    color: Colors.white,
//                                    size: 16,
//                                  ),
//                                  SizedBox(
//                                    width: 8,
//                                  ),
//                                  Flexible(
//                                    child: Text(
//                                      items[index].location,
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontFamily: 'Avenir',
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
////                        Expanded(
////                          flex: 2,
////                          child: Column(
////                            mainAxisSize: MainAxisSize.min,
////                            children: <Widget>[
////                              Text(
////                                items[index].rating.toString(),
////                                style: TextStyle(
////                                    color: Colors.white,
////                                    fontFamily: 'Avenir',
////                                    fontSize: 18,
////                                    fontWeight: FontWeight.w700),
////                              ),
////
////                            ],
////                          ),
////                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
//
//class PlaceInfo {
//  final String name;
//  final String category;
//  final String location;
//  final Color startColor;
//  final Color endColor;
//
//  PlaceInfo(this.name, this.startColor, this.endColor,
//      this.location, this.category);
//}
//
//class CustomCardShapePainter extends CustomPainter {
//  final double radius;
//  final Color startColor;
//  final Color endColor;
//
//  CustomCardShapePainter(this.radius, this.startColor, this.endColor);
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    var radius = 24.0;
//
//    var paint = Paint();
//    paint.shader = ui.Gradient.linear(
//        Offset(0, 0), Offset(size.width, size.height), [
//      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
//      endColor
//    ]);
//
//    var path = Path()
//      ..moveTo(0, size.height)
//      ..lineTo(size.width - radius, size.height)
//      ..quadraticBezierTo(
//          size.width, size.height, size.width, size.height - radius)
//      ..lineTo(size.width, radius)
//      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
//      ..lineTo(size.width - 1.5 * radius, 0)
//      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
//      ..close();
//
//    canvas.drawPath(path, paint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}
