import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/1.png",),
  PageModel(
      imageUrl: "assets/2.png",),
  PageModel(
      imageUrl: "assets/3.png",),
  PageModel(
      imageUrl: "assets/4.png",),
];

List<List<Color>> gradients = [
  [Colors.black, Colors.black],
  [Colors.black, Colors.black],
  [Colors.black, Colors.black],
];

class PageModel {
  var imageUrl;
  PageModel({
    this.imageUrl
  });
}
