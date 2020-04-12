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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
import 'dart:async';
import '../fade_animation.dart';

class MyApp extends StatefulWidget with NavigationStates{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with TickerProviderStateMixin{
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
        begin: 1.0, end: 0.8
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _widthController.forward();
      }
    });

    _widthController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600)
    );

    _widthAnimation = Tween<double>(
        begin: 80.0,
        end: 300.0
    ).animate(_widthController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _positionController.forward();
      }
    });

    _positionController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );

    _positionAnimation = Tween<double>(
        begin: 0.0,
        end: 215.0
    ).animate(_positionController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          hideIcon = true;
        });
        _scale2Controller.forward();
      }
    });

    _scale2Controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

  }
  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds:2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AfterSplash())));
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(1, Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              )),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(1.3, Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              )),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(1.6, Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              )),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Welcome To Payana",
                    style: TextStyle(color: Colors.white, fontSize: 50),)),
                  SizedBox(height: 100,),
//                  FadeAnimation(1.3, Text("We promise that you'll have the most \nfuss-free time with us ever.",
//                    style: TextStyle(color: Colors.blueGrey, height: 1.4, fontSize: 20),)),
//                  SizedBox(height: 100,),
                ],
              ),
            ),
          ],
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
    bool _seen =  (prefs.getBool('seen') ?? false);
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