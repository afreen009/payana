//import 'package:flutter/material.dart';
//import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
//class HomePage extends StatelessWidget with NavigationStates {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Text(
//        "HomePage",
//        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
//      ),
//    );
//  }
//}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';

class MyApp extends StatefulWidget with NavigationStates{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with TickerProviderStateMixin{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    Timer(
        Duration(seconds:0),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AfterSplash())));
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child:  Container(
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/0.png'),
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
    );
  }
}


class AfterSplash extends StatefulWidget {
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
//(prefs.getBool('seen') ?? false)
    if (_seen) {
      print('home');
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, 'intro');
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(child: null);
  }
}