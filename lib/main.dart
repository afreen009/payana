

////
////class HomePage extends StatefulWidget {
////  @override
////  _HomePageState createState() => _HomePageState();
////}
////
////class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
////
////  AnimationController _scaleController;
////  AnimationController _scale2Controller;
////  AnimationController _widthController;
////  AnimationController _positionController;
////
////  Animation<double> _scaleAnimation;
////  Animation<double> _scale2Animation;
////  Animation<double> _widthAnimation;
////  Animation<double> _positionAnimation;
////
////  bool hideIcon = false;
////
////  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////
////    _scaleController = AnimationController(
////        vsync: this,
////        duration: Duration(milliseconds: 300)
////    );
////
////    _scaleAnimation = Tween<double>(
////        begin: 1.0, end: 0.8
////    ).animate(_scaleController)..addStatusListener((status) {
////      if (status == AnimationStatus.completed) {
////        _widthController.forward();
////      }
////    });
////
////    _widthController = AnimationController(
////        vsync: this,
////        duration: Duration(milliseconds: 600)
////    );
////
////    _widthAnimation = Tween<double>(
////        begin: 80.0,
////        end: 300.0
////    ).animate(_widthController)..addStatusListener((status) {
////      if (status == AnimationStatus.completed) {
////        _positionController.forward();
////      }
////    });
////
////    _positionController = AnimationController(
////        vsync: this,
////        duration: Duration(milliseconds: 1000)
////    );
////
////    _positionAnimation = Tween<double>(
////        begin: 0.0,
////        end: 215.0
////    ).animate(_positionController)..addStatusListener((status) {
////      if (status == AnimationStatus.completed) {
////        setState(() {
////          hideIcon = true;
////        });
////        _scale2Controller.forward();
////      }
////    });
////
////    _scale2Controller = AnimationController(
////        vsync: this,
////        duration: Duration(milliseconds: 300)
////    );
////
////    _scale2Animation = Tween<double>(
////        begin: 1.0,
////        end: 32.0
////    ).animate(_scale2Controller)..addStatusListener((status) {
////      if (status == AnimationStatus.completed) {
////        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SideBarLayout()));
////      }
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    final double width = MediaQuery.of(context).size.width;
////
////    return Scaffold(
////      backgroundColor: Colors.white,
////      body: Container(
////        width: double.infinity,
////        child: Stack(
////          children: <Widget>[
////
////            Positioned(
////              top: 100,
////              left: 0,
////              child: FadeAnimation(1.3, Container(
////                width: width,
////                height: 400,
////                decoration: BoxDecoration(
////                    image: DecorationImage(
////                        image: AssetImage('assets/preview.gif'),
////                        fit: BoxFit.cover
////                    )
////                ),
////              )),
////            ),
//////            Positioned(
//////              top: -150,
//////              left: 0,
//////              child: FadeAnimation(1.6, Container(
//////                width: width,
//////                height: 400,
//////                decoration: BoxDecoration(
//////                    image: DecorationImage(
//////                        image: AssetImage('assets/images/one.png'),
//////                        fit: BoxFit.cover
//////                    )
//////                ),
//////              )),
//////            ),
////            Container(
////              padding: EdgeInsets.all(20.0),
////              child: Column(
////                mainAxisAlignment: MainAxisAlignment.end,
////                crossAxisAlignment: CrossAxisAlignment.start,
////                children: <Widget>[
////                  FadeAnimation(1, Text("Welcome",
////                    style: TextStyle(color: Colors.white, fontSize: 50),)),
////                  SizedBox(height: 15,),
////                  FadeAnimation(1.6, AnimatedBuilder(
////                    animation: _scaleController,
////                    builder: (context, child) => Transform.scale(
////                        scale: _scaleAnimation.value,
////                        child: Center(
////                          child: AnimatedBuilder(
////                            animation: _widthController,
////                            builder: (context, child) => Container(
////                              width: _widthAnimation.value,
////                              height: 80,
////                              padding: EdgeInsets.all(10),
////                              decoration: BoxDecoration(
////                                  borderRadius: BorderRadius.circular(50),
////                                  color: Colors.blue.withOpacity(.4)
////                              ),
////                              child: InkWell(
////                                onTap: () {
////                                  _scaleController.forward();
////                                },
////                                child: Stack(
////                                    children: <Widget> [
////                                      AnimatedBuilder(
////                                        animation: _positionController,
////                                        builder: (context, child) => Positioned(
////                                          left: _positionAnimation.value,
////                                          child: AnimatedBuilder(
////                                            animation: _scale2Controller,
////                                            builder: (context, child) => Transform.scale(
////                                                scale: _scale2Animation.value,
////                                                child: Container(
////                                                  width: 60,
////                                                  height: 60,
////                                                  decoration: BoxDecoration(
////                                                      shape: BoxShape.circle,
////                                                      color: Colors.blue
////                                                  ),
////                                                  child: hideIcon == false ? Icon(Icons.arrow_forward, color: Colors.white,) : Container(),
////                                                )
////                                            ),
////                                          ),
////                                        ),
////                                      ),
////                                    ]
////                                ),
////                              ),
////                            ),
////                          ),
////                        )),
////                  )),
////                  SizedBox(height: 100,),
////                ],
////              ),
////            )
////          ],
////        ),
////      ),
////    );
////  }
////}
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:sidebaranimationflutter/sidebar/sidebar_layout.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/services.dart';
//
//import 'package:liquid_swipe/Constants/Helpers.dart';
//import 'package:splashscreen/splashscreen.dart';
//import 'package:liquid_swipe/liquid_swipe.dart';
///
//
// /void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(),
//      debugShowCheckedModeBanner: false,
//      home: SplashScreen(),
//    );
//  }
//}
//
//class SplashScreen extends StatefulWidget {
//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: Container(
//          height: MediaQuery.of(context).size.height,
//          width: 1000,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('assets/preview.gif',),
////              fit: BoxFit.cover
//            ),
//          ),
//          child: Padding(
//            padding: const EdgeInsets.all(50.0),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(top: 45),
//                  child: FadeAnimatedTextKit(
//                    duration: Duration(milliseconds: 100),
//                    isRepeatingAnimation: false,
//                    totalRepeatCount: 0,
//                    text: ["Journey Begins"],
//                    alignment: AlignmentDirectional.centerStart,
//                    textAlign: TextAlign.center,
//                    textStyle: GoogleFonts.bahianita(
//                      color: Colors.black,
//                      fontSize: 30
//                    ),
//                  ),
//                ),
//                RaisedButton(
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  color: Colors.indigo,
//                  onPressed: () {
//                    print('Tap');
//                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()));
//                  },
//                  child: Text(
//                    'Get Started',
//                    style: TextStyle(
//                      fontSize: 15.0,
//                      fontWeight: FontWeight.w400,
//                      color: Colors.white,
//                      letterSpacing: 0,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
////Color bgColor = Colors.white;
//////Color textColor = Color(0xFF83838A);
//////
//////List<String> imagePath = [
//////  "assets/img/undraw_campfire_s6y4.png",
//////  "assets/img/undraw_location_search_bqps.png",
//////  "assets/img/undraw_at_the_park_2e47.png",
//////];
//////List<String> title = ["Welcome", "Search", "Ready , set .."];
//////List<String> description = [
//////  "Travel the fun way ",
//////  "Anytime.",
//////  "Anywhere."
//////];
//////
//////class HomePage extends StatelessWidget {
//////  @override
//////  Widget build(BuildContext context) {
//////    return Scaffold(
//////      backgroundColor: bgColor,
//////      body: ContentPage(),
//////    );
//////  }
//////}
//////
//////class ContentPage extends StatelessWidget {
//////  @override
//////  Widget build(BuildContext context) {
//////    return Padding(
//////        padding: EdgeInsets.only(top: 30),
//////        child: Column(
//////          children: <Widget>[
//////            CarouselSlider(
//////              autoPlay: false,
//////              enableInfiniteScroll: false,
//////              initialPage: 0,
//////              reverse: false,
//////              viewportFraction: 1.0,
//////              aspectRatio: MediaQuery.of(context).size.aspectRatio,
//////              height: MediaQuery.of(context).size.height - 30,
//////              items: [0, 1, 2].map((i) {
//////                return Builder(
//////                  builder: (BuildContext context) {
//////                    return Container(
//////                        width: MediaQuery.of(context).size.width,
//////                        child: AppItro(i));
//////                  },
//////                );
//////              }).toList(),
//////            ),
//////          ],
//////        ));
//////  }
//////}
//////
//////class AppItro extends StatefulWidget {
//////  int index;
//////  AppItro(this.index);
//////  @override
//////  _AppItroState createState() => _AppItroState();
//////}
//////
//////class _AppItroState extends State<AppItro> {
//////  @override
//////  void initState() {
//////    // TODO: implement initState
//////    super.initState();
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
////////    SystemChrome.setEnabledSystemUIOverlays([]);
//////    return Column(
//////      mainAxisSize: MainAxisSize.max,
//////      crossAxisAlignment: CrossAxisAlignment.start,
//////      children: <Widget>[
//////        Container(
//////          width: MediaQuery.of(context).size.width,
//////          height: 50,
//////          child: Stack(
//////            children: <Widget>[
//////              Positioned(
//////                  left: 24,
//////                  top: 14,
//////                  child: new Text(
//////                    "Numero\u00B9",
//////                    style: TextStyle(fontFamily: "AvenirBold", fontSize: 16),
//////                  )),
//////              Positioned(
//////                  right: 24,
//////                  top: 14,
//////                  child: GestureDetector(
//////                    child: new Text(
//////                      widget.index == 2 ? "DONE" : "SKIP",
//////                      style: TextStyle(
//////                          fontSize: 16,
//////                          color: textColor,
//////                          fontFamily: "SultanNahia"),
//////                    ),
//////                    onTap: () {
//////                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SideBarLayout()));
//////                    },
//////                  ),)
//////            ],
//////          ),
//////        ),
//////        Container(
//////          width: MediaQuery.of(context).size.width,
//////          height: 610,
//////          child: Column(
//////            children: <Widget>[
//////              Image.asset(imagePath[widget.index],
//////                  width: MediaQuery.of(context).size.width),
//////              Center(
//////                  child: new Text(
//////                    title[widget.index],
//////                    style: TextStyle(fontFamily: "Caslon", fontSize: 30),
//////                  )),
//////              Container(
//////                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//////                child: Center(
//////                  child: new RichText(
//////                      textAlign: TextAlign.center,
//////                      text: new TextSpan(
//////                          style: new TextStyle(
//////                            fontSize: 14.0,
//////                            color: Colors.black,
//////                          ),
//////                          children: <TextSpan>[
//////                            new TextSpan(
//////                                text: description[widget.index],
//////                                style: new TextStyle(fontFamily: 'Avenir')),
//////                            new TextSpan(
//////                                text: widget.index == 0 ? 'Numero1.' : '',
//////                                style: new TextStyle(
//////                                    fontWeight: FontWeight.normal,
//////                                    fontFamily: 'AvenirBold'))
//////                          ])),
//////                ),
//////              )
//////            ],
//////          ),
//////        ),
//////        Container(
//////          width: MediaQuery.of(context).size.width,
//////          padding: EdgeInsets.symmetric(horizontal: 5),
//////          height: 50,
//////          child: Stack(
//////            children: <Widget>[
//////              Dots(widget.index),
//////              Center(
//////                child: new Text("Swipe right",
//////                    style: TextStyle(fontFamily: "Avenir", fontSize: 20)),
//////              ),
//////              Positioned(
//////                  right: 0,
//////                  top: widget.index != 2 ? 20 : 0,
//////                  child: widget.index != 2
//////                      ? Image.asset(
//////                    'assets/img/arrow.png',
//////                    width: 6,
//////                  )
//////                      : LetsGo())
//////            ],
//////          ),
//////        )
//////      ],
//////    );
//////  }
//////}
//////
//////class Dots extends StatefulWidget {
//////  int index;
//////  Dots(this.index);
//////  @override
//////  _DotsState createState() => _DotsState();
//////}
//////
//////class _DotsState extends State<Dots> {
//////  @override
//////  void initState() {
//////    // TODO: implement initState
//////    super.initState();
//////    // print("deneme" + currentPage.toString());
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return ListView.builder(
//////      scrollDirection: Axis.horizontal,
//////      itemCount: 3,
//////      itemBuilder: (context, int index) {
//////        return Container(
//////            margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
//////            width: 10,
//////            height: 10,
//////            decoration: BoxDecoration(
//////              shape: BoxShape.circle,
//////                color: index == widget.index ? Colors.black : Colors.white,
//////                border: Border.all(color: Colors.indigo)));
//////      },
//////    );
//////  }
//////}
//////
//////class LetsGo extends StatelessWidget {
//////  @override
//////  Widget build(BuildContext context) {
//////    return RaisedButton(
//////      shape: RoundedRectangleBorder(
//////        borderRadius: BorderRadius.circular(10),
//////      ),
//////      color: Colors.indigo,
//////      onPressed: () {
//////        print('Tap');
//////        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SideBarLayout()));
//////      },
//////      child: Text(
//////        'Lets go',
//////        style: TextStyle(
//////          fontSize: 15.0,
//////          fontWeight: FontWeight.w400,
//////          color: Colors.white,
//////          letterSpacing: 0,
//////        ),
//////      ),
//////    );
//////  }
//////}

import 'package:flutter/material.dart';
import 'package:sidebaranimationflutter/pages/mobnumber.dart';
import 'package:sidebaranimationflutter/root_screen.dart';
import 'package:sidebaranimationflutter/screens/landing_page.dart';
import 'package:sidebaranimationflutter/sidebar/sidebar_layout.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:fluro/fluro.dart';
import 'package:sidebaranimationflutter/pages/homepage.dart';
import 'dart:async';
//https://github.com/MarcusNg/flutter_onboarding_ui/tree/master/lib

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

      title: 'Taxi',
          onGenerateRoute: router.generator,theme:
         ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            fontFamily: 'Ubuntu',
            textTheme: TextTheme(
                title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                subtitle: TextStyle(color: Colors.black54),
                subhead:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w800),
                headline:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800))),
  ));
}
//class HomePage extends StatelessWidget with NavigationStates{
//  @override
//  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//      statusBarIconBrightness: Brightness.dark,
//      statusBarBrightness:
//      Platform.isAndroid ? Brightness.dark : Brightness.light,
//      systemNavigationBarColor: Colors.transparent,
//      systemNavigationBarDividerColor: Colors.transparent,
//      systemNavigationBarIconBrightness: Brightness.dark,
//    ));https://www.youtube.com/watch?v=tlj2oNJkbjo, https://www.youtube.com/watch?v=OBaP6KdYq4E
//    return Scaffold(
//      body: BlocProvider<NavigationBloc>(
//        create: (context) => NavigationBloc(),
//        child: Stack(
//          children: <Widget>[
//            BlocBuilder<NavigationBloc, NavigationStates>(
//              builder: (context, navigationState) {
//                return navigationState as Widget;
//              },
//            ),
//            LandingPage(),
//          ],
//        ),
//      ),
//    );
//  }

//}

//  @override
////  Widget build(BuildContext context) {
////    return Center(
////      child: Text(
////        "HomePage",
////        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
////      ),
////    );
////  }
//  static const TextStyle goldcoinGreyStyle = TextStyle(
//      color: Colors.grey,
//      fontSize: 20.0,
//      fontWeight: FontWeight.bold,
//      fontFamily: "Product Sans");
//
//  static const TextStyle goldCoinWhiteStyle = TextStyle(
//      color: Colors.white,
//      fontSize: 20.0,
//      fontWeight: FontWeight.bold,
//      fontFamily: "Product Sans");
//
//  static const TextStyle greyStyle =
//  TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
//  static const TextStyle whiteStyle =
//  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");
//
//  static const TextStyle boldStyle = TextStyle(
//    fontSize: 50.0,
//    color: Colors.black,
//    fontFamily: "Product Sans",
//    fontWeight: FontWeight.bold,
//  );
//
//  static const TextStyle descriptionGreyStyle = TextStyle(
//    color: Colors.grey,
//    fontSize: 20.0,
//    fontFamily: "Product Sans",
//  );
//
//  static const TextStyle descriptionWhiteStyle = TextStyle(
//    color: Colors.white,
//    fontSize: 20.0,
//    fontFamily: "Product Sans",
//  );
//
//  final pages = [
//    Container(
//      color: Colors.white,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Container(
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: new DecorationImage(
//                      fit: BoxFit.fill,
//                        image: ExactAssetImage('assets/undraw_navigation_lytx.png')),
//                  ),
//                ),
//                RaisedButton(
//                  color: Colors.white,
//                  child: Text(
//                    "Skip",
//                    style: goldcoinGreyStyle,
//                  ),
//                  onPressed: (){
//                    print("hi");
//                  },
//                ),
//              ],
//            ),
//          ),
//          Image.asset("assets/img/undraw_campfire_s6y4.png"),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 30.0),
//            child: Column(
//              // mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Online",
//                  style: greyStyle,
//                ),
//                Text(
//                  "Gambling",
//                  style: boldStyle,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  "Temporibus autem aut\n"
//                      "officiis debitis aut rerum\n"
//                      "necessitatibus",
//                  style: descriptionGreyStyle,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    ),
//    Container(
//      color: Color(0xFF55006c),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                Image.asset("assets/logo.jpeg"),
//                Text(
//                  "Skip",
//                  style: goldCoinWhiteStyle,
//                ),
//              ],
//            ),
//          ),
//          Center(
//            child: new Container(
//              width: 300.0,
//              height: 300.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: new DecorationImage(
//                    fit: BoxFit.fill,
//                    image: ExactAssetImage('assets/img/undraw_navigation_lytx.png')),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 30.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Online",
//                  style: whiteStyle,
//                ),
//                Text(
//                  "Gaming",
//                  style: boldStyle,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  "Excepteur sint occaecat cupidatat\n"
//                      "non proident, sunt in\n"
//                      "culpa qui officia",
//                  style: descriptionWhiteStyle,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    ),
//    Container(
//      color: Colors.orange,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                Container(
////                  height:10,
////                  width: 10,
////                ),
//                Text(
//                  "Skip",
//                  style: goldCoinWhiteStyle,
//                ),
//              ],
//            ),
//          ),
////          Image.asset("assets/img/undraw_at_the_park_2e47.png"),
//          Center(
//            child: new Container(
//              width: 300.0,
//              height: 300.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: new DecorationImage(
//                    fit: BoxFit.fill,
//                    image: ExactAssetImage('assets/img/undraw_at_the_park_2e47.png')),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 30.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Online",
//                  style: whiteStyle,
//                ),
//                Text(
//                  "Gambling",
//                  style: boldStyle,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  "Temporibus autem aut\n"
//                      "officiis debitis aut rerum\n"
//                      "necessitatibus",
//                  style: descriptionWhiteStyle,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    ),
//  ];
//
////  static BuildContext get context => null;
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        body: LiquidSwipe(
//          pages: this.pages,
//          enableLoop: true,
//          fullTransitionValue: 300,
//          enableSlideIcon: true,
//          waveType: WaveType.liquidReveal,
//          positionSlideIcon: 0.5,
//        ),
//      ),
//    );
//  }
