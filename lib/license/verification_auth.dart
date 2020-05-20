import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}



//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//class VeriAuth {
//
//  Future<List<User>> fetchRecentPosts() async {
//    String veriUrl = ApiUtil.MAIN_API_URL + '/userIdentity';
//    Map<String,String> headers ={
//      'Accept' : 'application/json'
//    };
//    var response = await http.get{veriUrl , headers: headers};
//    List<User> users [];
//    if(response.statusCode ==200) {
//      var body = jsonDecode(response.body);
//      for(var item in body['data']){
//        User user =User.fromJson(item);
//        users.
//    }
//    }
//  }
//
//
//}