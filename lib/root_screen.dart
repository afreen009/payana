import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/sidebar_animation_flutter/lib/src/util/mobnumber.dart';
import 'package:sidebaranimationflutter/sidebar/sidebar_layout.dart';

class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Container(
            color: Colors.white,
          );
        } else {
          if (snapshot.hasData) {
            return new SideBarLayout(
//              firebaseUser: snapshot.data,
            );
          } else {
            return LoginScreen();
          }
        }
      },
    );
  }
}
