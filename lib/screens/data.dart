import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/images/ill.png",
      title: "Travel",
      body: "from anywhere",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/images/slider_3.png",
      title: "Meet people",
      body: "anytime, anywhere",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/illusr.png",
      title: "Lets go",
      body: "LET'S HIKE UP",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFFFCCF31), Color(0xFF736EFE)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
