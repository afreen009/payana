import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebaranimationflutter/root_screen.dart';
import 'package:sidebaranimationflutter/screens/landing_page.dart';
import 'package:fluro/fluro.dart';
import 'package:sidebaranimationflutter/pages/homepage.dart';
import 'package:sidebaranimationflutter/src/util/mobnumber.dart';
//https://github.com/MarcusNg/flutter_onboarding_ui/tree/master/lib

//unhandled handshake
//class MyHttpOverrides extends HttpOverrides{
//  @override
//  HttpClient createHttpClient(SecurityContext context) {
//    // TODO: implement createHttpClient
//    return new HttpClient(context: context)
//        ..badCertificateCallback = (X509Certificate cert, String  host,int port)=> true;
//  }
//}
void main() {

  Router router = new Router();

//  router.define('splash', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
//    return new SplashScreen();
//  }));
  router.define('intro', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return new LandingPage();
  }));
  router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return RootScreen();
  }));
  router.define('mob', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return LoginScreen();
  }));
//  router.define('otp', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
//    return Otp();
//  }));

  runApp(

      new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
          onGenerateRoute: router.generator,theme:
         ThemeData(
           primaryColor: Colors.blueGrey,

            ),
  ));
}

//class MainPage extends StatefulWidget {
//  @override
//  _MainPageState createState() => _MainPageState();
//}

//class _MainPageState extends State<MainPage> {
//  FlutterSecureStorage storage;
//  SharedPreferences sharedPreferences;
//
//  @override
//  void initState() {
//    super.initState();
//    storage = FlutterSecureStorage();
//    checkLoginStatus();
//  }
//  @override
//  void dispose() {
//    super.dispose();
//    storage = null;
//  }
//  checkLoginStatus() async {
//    sharedPreferences = await SharedPreferences.getInstance();
//    print(sharedPreferences.getString("userid"));
//    if(sharedPreferences.getString("userId") == null) {
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Code Land", style: TextStyle(color: Colors.white)),
//        actions: <Widget>[
//          FlatButton(
//            onPressed: () {
//              sharedPreferences.clear();
//              // ignore: deprecated_member_use
//              sharedPreferences.commit();
//              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
//            },
//            child: Text("Log Out", style: TextStyle(color: Colors.white)),
//          ),
//        ],
//      ),
//      body: Center(child: Text("Main Page")),
//      drawer: Drawer(),
//    );
//  }
//}


////
// fontFamily: 'Ubuntu',
//            textTheme: TextTheme(
//                title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
//                subtitle: TextStyle(color: Colors.black54),
//                subhead:
//                TextStyle(color: Colors.black54, fontWeight: FontWeight.w800),
//                headline:
//                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800))

