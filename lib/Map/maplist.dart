import 'package:google_maps_flutter/google_maps_flutter.dart';

class BiutimiList {
  LatLng position;
  String image;
  String name;
  String text;
  bool tag1;
  bool tag2;
  bool tag3;

  BiutimiList({this.position, this.image, this.name, this.text, this.tag1, this.tag2, this.tag3});
}

List<BiutimiList> biutimiList = [
  BiutimiList(
    position: LatLng(13.136423, 78.117320),
    image: "assets/blu/blu.jpg",
    name: "Ivetka Style",
    text: "ABCDEFG",
    tag1: true,
    tag2: false,
    tag3: false,
  ),
  BiutimiList(
    position: LatLng(13.034556, 77.627108),
    image: "assets/blu/blu1.jpg",
    name: "Beauti",
    text: "BCDEFGA",
    tag1: true,
    tag2: true,
    tag3: false,
  ),
  BiutimiList(
    position: LatLng(13.046859, 77.609869),
    image: "assets/blu/blu2.jpg",
    name: "Visual Studio",
    text: "CDEFGAB",
    tag1: true,
    tag2: true,
    tag3: true,
  ),

  // center position
  BiutimiList(
    position: LatLng(13.036176, 77.620503),
    image: null,
    name: "Center",
    text: "Center",
    tag1: false,
    tag2: false,
    tag3: false,
  ),
];