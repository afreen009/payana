import 'dart:convert';

import 'package:http/http.dart' as http;
class Otp {
  String url = "https://dev.sharvitechnologies.com/otp/generate/";
  List body =[
    {
      "Mobile":"9008519710"
    }
  ];
  Otp({this.url, this.body});

  factory Otp.fromJson(Map<String, dynamic> json) {
    return Otp(
      url: json['url'],
      body: json['body'],
    );
  }
}
Future<Otp> createAlbum(String title) async {
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
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Otp.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}