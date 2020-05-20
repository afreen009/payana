import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
import 'package:sidebaranimationflutter/services/authservice.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth +10,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  color:  Colors.white,
                  child: Column(
                    children: <Widget>[
//                      SizedBox(
//                        height: 30,
//                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 0),
                        padding: EdgeInsets.only(left: 0),
                        color: Colors.blueGrey,
                        height: 180,
                        child: Center(
                          child: ListTile(
//                          leading: CircleAvatar(
//                            backgroundColor: Colors.lightBlueAccent,
//                            child: Icon(
//                              Icons.person,
//                              color: Colors.white,
//                            ),
//                            radius: 40,
//                          ),
                            title: Text(
                              "8618210228",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              radius: 40,
                            ),
                          ),
                        ),
                      ),
//                      Divider(
//                        height: 4,
//                        thickness: 3.0,
//                        color: Colors.amber,
//                        indent: 12,
//                        endIndent: 32,
//                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomeEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.history,
                        title: "Ride History",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.RideHistoryEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.attach_money,
                        title: "Payments",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.PaymentEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.attach_money,
                        title: "KYC",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.VerificationEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_travel,
                        title: "Promocode",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.PromoCode);
                        },
                      ),

                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                        onTap: () {
                          onIconPressed();
                          AuthService().signOut();
                        },
                      ),
//                      Divider(
//                        height: 64,
//                        thickness: 0.5,
//                        color: Colors.grey,
//                        indent: 32,
//                        endIndent: 0,
//                      ),
                      Divider(
                        height: 10,
                        thickness: 1.0,
                        color: Colors.amber,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.info,
                        title: "About",
                        onTap: () {
//                          onIconPressed();
//                          BlocProvider.of<NavigationBloc>(context)
//                              .add(NavigationEvents.MyOrdersClickedEvent);
                        },
                      ),

                      MenuItem(
                        icon: Icons.filter_none,
                        title: "Terms & Conditions",
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.8),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 45,
                      height: 110,
                      color: Colors.blueGrey,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}



