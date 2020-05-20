import 'package:flutter/material.dart';

class bikeList extends StatefulWidget {
  @override
  bikeListState createState() => bikeListState();
}

class bikeListState extends State<bikeList> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        height: 40,
        color: Colors.indigo,
        child: Placeholder(),
      ),
    );
  }
}
