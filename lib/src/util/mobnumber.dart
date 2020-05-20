import 'dart:convert';
import 'dart:io';
import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidebaranimationflutter/root_screen.dart';
import 'package:http/http.dart' as http;
import 'package:sidebaranimationflutter/sidebar/sidebar_layout.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
import 'package:sidebaranimationflutter/src/util/otp.dart';

final _phoneController = TextEditingController();
final _codeController = TextEditingController();
class LoginScreen extends StatelessWidget with NavigationStates{
  @override
  void initState (){
    _phoneController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Center(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                SizedBox(height: 180,),
                    Text("Enter Your Mobile Number",style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "Montserrat-Black"),),

                    SizedBox(height: 16,),

                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefix: Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text('+91',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.white30,
                          hintText: "Mobile number"
                      ),
//                      maxLength: 10,
                      controller: _phoneController,
                      autovalidate: true,
                      autocorrect: false,
                      maxLengthEnforced: true,
//                      validator: (value) {
//                        return value != null
//                            ? 'Please provide a valid 10 digit phone number'
//                            : null;
//                      },
                    ),
//                    SizedBox(height: 20,),

                    Row(
                      children: <Widget>[
                        RaisedButton(child: Text(
                            "verify",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                          textColor: Colors.white,
                          onPressed: () async{
                            final phone = "+91" + _phoneController.text.trim();
                            print(phone);
                            signIn("authuser", _phoneController.text, context);
//                            post(_phoneController.text);
//                              Navigator.push(context, MaterialPageRoute(builder: ((context) => SideBarLayout())));
//                            Navigator.push(context, MaterialPageRoute(builder: ((context) => OtpPage(text: phone,))));
//                      loginUser(phone, context);
                          },
                          elevation: 20,
                          color: Colors.blueGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25) ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
      ),
      onWillPop: ()  {
        return  SystemNavigator.pop();
      },
    );
  }
  Future<http.Response>  signIn(String user, number, BuildContext context) async {
      var url = "https://dev.sharvitechnologies.com/payanaApp/app/v1/userSignUp";
      var body = json.encode({"authUser": user, "mobile": number});

      Map<String,String> headers = {
        'Content-type' : 'application/json',
        'Accept': 'application/json',
      };

      final response =
      await http.post(url, body: body, headers: headers);
      final responseJson = json.decode(response.body);
      print(responseJson);
      return response;

//    print("$user, $number");
//    Map data = {
//      'authUser': user,
//      'mobile': number
//    };
//    HttpClient client = new HttpClient();
//    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
//    String url ='https://dev.sharvitechnologies.com/payanaApp/app/v1/userSignUp';
//    HttpClientRequest request = await client.postUrl(Uri.parse(url));
////    request.persistentConnection = false;
//    request.headers.set('content-type', 'application/json');
//    request.add(utf8.encode(json.encode(data)));
//    print(data);
//    HttpClientResponse response = await request.close();
//    print(request);
//    print(response.statusCode);
//     await for (var contents in response.transform(utf8.decoder)) {
//       var parsedJson = json.decode(contents);
//       print('${parsedJson.runtimeType} : $parsedJson');
//       var userId = parsedJson['userId'];
//      print(contents);
//      print(userId);
//      client.close();
//    }
////    String reply = await response.transform(utf8.decoder).join();
////    print(reply);
//    if(response.statusCode == 200){
//      var username;
//      print(response.statusCode);
//      print("hi shifa");
//      print('Subject: $response.certificate.subject');
//      print('Issuer: ${response.certificate.issuer}');
////      _sendDataToSecondScreen(context);
//    }
  }
   post(mobile)async{
    print(mobile);
    String url = "https://dev.sharvitechnologies.com/otp/generate/";
    http.post(url,
      headers: {
      'content-type': 'application/json',
      },
      body: {}
    );
//    http.post{url,
//     headers: {
//     'content-type': 'application/json',
//     },
//     body
//   }
//    Map data = {
//      "Mobile": mobile
//    };
//    HttpClient client = new HttpClient();
//    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
//    String url = "https://dev.sharvitechnologies.com/otp/generate/";
//    HttpClientRequest request = await client.postUrl(Uri.parse(url));
////    request.persistentConnection = false;
//    request.headers.set('content-type', 'application/json');
//    request.add(utf8.encode(json.encode(data)));
//    print(data);
//    HttpClientResponse response = await request.close();
//    if(response.statusCode == 200){
//      var username;
//      print(response.statusCode);
////      SharedPreferences prefs = await SharedPreferences.getInstance();
////      print("otp is");
////      print("hi shifa");
//      print('Subject: $response.certificate.subject');
//      print('Issuer: ${response.certificate.issuer}');
//    }
  }
}

// get the text in the TextField and start the Second Screen
void _sendDataToSecondScreen(BuildContext context) {
  String textToSend = _phoneController.text;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(texts: textToSend,),
      ));
}


//
//
////class MobNumber extends StatefulWidget{
////@override
////State<StatefulWidget> createState() => _MobNumberState();
////}
////
////class _MobNumberState extends State<MobNumber> with NavigationStates {
////  final formKey = new GlobalKey<FormState>();
////
////  String phoneNo, verificationId, smsCode;
////
////  bool codeSent = false;
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      body: Form(
////          key: formKey,
////          child: Column(
////            mainAxisAlignment: MainAxisAlignment.center,
////            children: <Widget>[
////              Padding(
////                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
////                  child: TextFormField(
////                    keyboardType: TextInputType.phone,
////                    decoration: InputDecoration(hintText: 'Enter phone number'),
////                    onChanged: (val) {
////                      setState(() {
////                        this.phoneNo = val;
////                      });
////                    },
////                  )),
////              codeSent ? Padding(
////                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
////                  child: TextFormField(
////                    keyboardType: TextInputType.phone,
////                    decoration: InputDecoration(hintText: 'Enter OTP'),
////                    onChanged: (val) {
////                      setState(() {
////                        this.smsCode = val;
////                      });
////                    },
////                  )) : Container(),
////              Padding(
////                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
////                  child: RaisedButton(
////                      child: Center(child: codeSent ? Text('Login'):Text('Verify')),
////                      onPressed: () {
////                        codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
////                      }))
////            ],
////          )),
////    );
////  }
////
////  Future<void> verifyPhone(phoneNo) async {
////    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
////      AuthService().signIn(authResult);
////    };
////
////    final PhoneVerificationFailed verificationfailed =
////        (AuthException authException) {
////      print('${authException.message}');
////    };
////
////    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
////      this.verificationId = verId;
////      setState(() {
////        this.codeSent = true;
////      });
////    };
////
////    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
////      this.verificationId = verId;
////    };
////
////    await FirebaseAuth.instance.verifyPhoneNumber(
////        phoneNumber: phoneNo,
////        timeout: const Duration(seconds: 5),
////        verificationCompleted: verified,
////        verificationFailed: verificationfailed,
////        codeSent: smsSent,
////        codeAutoRetrievalTimeout: autoTimeout);
////  }
////}
////    print("inside");
////    final screenSize = MediaQuery.of(context).size;
////    return Scaffold(
////      body: Column(
////        children: <Widget>[
////          SizedBox(
////            height: 60,
////          ),
//////          Image.asset('assets/img/payana.png'),
////          Container(
////            child: Padding(
////              padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
////              child: Column(
////                mainAxisAlignment: MainAxisAlignment.start,
////                crossAxisAlignment: CrossAxisAlignment.start,
////                children: <Widget>[
////                  Text('Enter Mobile Number', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
////                  TextField(
////                    decoration: InputDecoration(
//////                            hintText: 'Mobile Number',
//////                            labelText: 'Mobile Nuumber',
////                        suffixIcon: Icon(Icons.phone, color: Color(0xff38b7e0),)
////                    ),
////                  ),
////                ],
////              ),
////            ),
////          ),
////          Container(
////            margin: EdgeInsets.only(left: 20, right: 20),
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////              children: <Widget>[
//////                  Text('Remembe', style: TextStyle(color: Colors.grey),),
////                RaisedButton(
////                  onPressed: () => _showDialog(context),
////                  child: Text('Verify', style: TextStyle(color: Colors.white),),
////                  elevation: 10,
////                  color: Colors.indigo,
////                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
////                ),
////              ],
////            ),
////          ),
////        ],
////      ),
////    );
////  }
////}
////class Otp extends StatefulWidget {
////  @override
////  _OtpState createState() => _OtpState();
////}
////
////class _OtpState extends State<Otp> {
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      backgroundColor: Colors.white,
//////      appBar: ,
////      body: Column(
////        children: <Widget>[
//////          Image.asset('assets/img/payana.png'),
////          Container(
////            child: Padding(
////              padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
////              child: Column(
////                mainAxisAlignment: MainAxisAlignment.start,
////                crossAxisAlignment: CrossAxisAlignment.start,
////                children: <Widget>[
////                  IconButton(icon: Icon(
////                      Icons.arrow_back_ios
////                  ), onPressed: (){
////                    Navigator.pushNamed(context, 'mob');
////                  }),
////                  SizedBox(height: 35,),
////                  Text('OTP', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
////                  TextField(
////                    decoration: InputDecoration(
//////                            hintText: 'Mobile Number',
//////                            labelText: 'Mobile Nuumber',
////                        suffixIcon: Icon(Icons.verified_user , color: Color(0xff38b7e0),)
////                    ),
////                  ),
////                ],
////              ),
////            ),
////          ),
////          Container(
////            margin: EdgeInsets.only(left: 20, right: 20),
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////              children: <Widget>[
//////                  Text('Remembe', style: TextStyle(color: Colors.grey),),
////                RaisedButton(
////                  onPressed: (){
////                    Navigator.pushNamed(context, 'home');
////                  },
////                  child: Text('Verify', style: TextStyle(color: Colors.white),),
////                  elevation: 10,
////                  color: Colors.indigo,
////                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
////                ),
////              ],
////            ),
////
////          ),
////          SizedBox(height: 80,),
////          Container(
////            child: Image(
////              fit: BoxFit.fill,
////              image: AssetImage('assets/otp.png'),
////            ),
////          )
////        ],
////      ),
////    );
////  }
////}
//////
////void _showDialog(context) {
////  // flutter defined function
////  showDialog(
////    context: context,
////    builder: (BuildContext context) {
////      // return object of type Dialog
////      return AlertDialog(
////        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
////        contentPadding: EdgeInsets.all(20),
////        title: new Text("Otp Sent"),
////        actions: <Widget>[
////          // usually buttons at the bottom of the dialog
////          new FlatButton(
////            child: new Text("ok",
////            style: TextStyle(fontSize: 20),),
////            onPressed: () {
////              Navigator.of(context).pop();
////              Navigator.pushNamed(context, 'otp');
////            },
////          ),
////        ],
////      );
////    },
////  );
////}