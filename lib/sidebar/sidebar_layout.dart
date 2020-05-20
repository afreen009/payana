//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget with NavigationStates{
//  final FirebaseUser firebaseUser;

//  SideBarLayout({this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
//            MultiBlocProvider(providers: [
//              BlocProvider<TaxiBookingBloc>(
//                create: (context) => TaxiBookingBloc(),
//              )
//            ],
//            child: HomeScreen(),),
           SideBar(),
//            MapPage()
          ],
        ),
      ),
    );
  }
}