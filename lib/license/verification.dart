import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
import 'package:sidebaranimationflutter/license/camera.dart';
import 'package:sidebaranimationflutter/license/licenseadhaar.dart';
import 'package:sidebaranimationflutter/license/verification_auth.dart';

class verrification extends StatefulWidget with NavigationStates{
  @override
  _verrificationState createState() => _verrificationState();
}

class _verrificationState extends State<verrification> {
  Color _color = Colors.indigo;
  Future<Album> _futureAlbum;
  int currentIndex = 2; // initial page = 2;
//
//  List<String> itemlist = [
//    "09:00",
//    "10:00",
//    "11:00",
//    "12:00",
//    "13:00",
//    "14:00",
//    "15:00",
//  ];

//  void onTab(int index) {
//    setState(() {
//      currentIndex = index;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.40,
              child: Stack(
                children: <Widget>[
                  // light green color container
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: screenHeight * 0.07,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(48.0),
                          bottomRight: Radius.circular(48.0),
                        ),
                      ),
                      child: Image.asset("assets/onecurve.png"),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 3,
                    child: SafeArea(
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 40,
                    child: SafeArea(
                        child: Text("Upload your Driving ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ))),
                  ),
                  Positioned(
                    top: 100,
                    left: 40,
                    child: SafeArea(
                        child: Text("License",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
            ),

//          Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                  height: 400.0,
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: <Widget>[
                          // email
                          GestureDetector(
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.white),
                              child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // icon
                                  Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: Icon(
                                        Icons.featured_play_list,
                                        size: 32.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),

                                  // divider
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, right: 58.0),
                                    padding: EdgeInsets.all(40.0),
                                    height: 64.0,
                                    width: 1.0,
                                    color: Colors.black,
                                  ),

                                  // e-mail
                                  Flexible(
                                    flex: 9,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "Driving license",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color:Colors.blueGrey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.line_weight,
                                              size: 14,
                                              color: _color.withOpacity(0.5),
                                            ),
                                            Text(
                                              "Enter No",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: _color.withOpacity(0.5),
                                                  fontWeight: FontWeight.w600,),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => License())));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              height: 80.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.amber),
                              child: Row(
                                children: <Widget>[
                                  // icon
                                  Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: Icon(
                                        Icons.featured_play_list,
                                        size: 32.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // divider
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, right: 16.0),
                                    height: 64.0,
                                    width: 1.0,
                                    color: Colors.black,
                                  ),

                                  // password
                                  Flexible(
                                    flex: 8,
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              "Driving License Front Image",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white.withOpacity(0.9),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.file_upload,
                                                  size: 14,
                                                  color: _color.withOpacity(0.5),
                                                ),
                                                Text(
                                                  "upload",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:_color.withOpacity(0.5),
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 24.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: ((context) => CameraScreen())));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              height: 80.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.amber),
                              child: Row(
                                children: <Widget>[
                                  // icon
                                  Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: Icon(
                                        Icons.featured_play_list,
                                        size: 32.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // divider
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, right: 16.0),
                                    height: 64.0,
                                    width: 1.0,
                                    color: Colors.black,
                                  ),

                                  // password
                                  Flexible(
                                    flex: 8,
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              "Driving License Back Image",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white.withOpacity(0.9),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.file_upload,
                                                  size: 14,
                                                  color: _color.withOpacity(0.5),
                                                ),
                                                Text(
                                                  "upload",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:_color.withOpacity(0.5),
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(width: 24.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: ((context) => CameraScreen())));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.0),
                              height: 80.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.amber),
                              child: Row(
                                children: <Widget>[
                                  // icon
                                  Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 32.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // divider
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, right: 16.0),
                                    height: 64.0,
                                    width: 1.0,
                                    color: Colors.black,
                                  ),

                                  // password
                                  Flexible(
                                    flex: 8,
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              "upload your selfie",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white.withOpacity(0.9),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.camera,
                                                  size: 14,
                                                  color: _color.withOpacity(0.5),
                                                ),
                                                Text(
                                                  "click",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:_color.withOpacity(0.5),
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(width: 24.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: ((context) => CameraScreen())));
                            },
                          ),
                        ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
