import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebaranimationflutter/root_screen.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if(user != null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => RootScreen()
            ));
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter Otp?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                        AuthResult result = await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RootScreen()
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                SizedBox(height: 180,),
                  Text("Login", style: TextStyle(color: Colors.indigo, fontSize: 36, fontWeight: FontWeight.w500),),

                  SizedBox(height: 16,),

                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefix: Container(
                        padding: EdgeInsets.all(4.0),
                        child: Text('+91',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Phone Number"
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
                  SizedBox(height: 16,),

                  RaisedButton(child: Text("Login"),
                    textColor: Colors.white,
                    onPressed: (){
                      final phone = "+91" + _phoneController.text.trim();
                      print(phone);
                      loginUser(phone, context);
                    },
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25) ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        )
    );
  }
}


//class MobNumber extends StatefulWidget{
//@override
//State<StatefulWidget> createState() => _MobNumberState();
//}
//
//class _MobNumberState extends State<MobNumber> with NavigationStates {
//  final formKey = new GlobalKey<FormState>();
//
//  String phoneNo, verificationId, smsCode;
//
//  bool codeSent = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Form(
//          key: formKey,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                  child: TextFormField(
//                    keyboardType: TextInputType.phone,
//                    decoration: InputDecoration(hintText: 'Enter phone number'),
//                    onChanged: (val) {
//                      setState(() {
//                        this.phoneNo = val;
//                      });
//                    },
//                  )),
//              codeSent ? Padding(
//                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                  child: TextFormField(
//                    keyboardType: TextInputType.phone,
//                    decoration: InputDecoration(hintText: 'Enter OTP'),
//                    onChanged: (val) {
//                      setState(() {
//                        this.smsCode = val;
//                      });
//                    },
//                  )) : Container(),
//              Padding(
//                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                  child: RaisedButton(
//                      child: Center(child: codeSent ? Text('Login'):Text('Verify')),
//                      onPressed: () {
//                        codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
//                      }))
//            ],
//          )),
//    );
//  }
//
//  Future<void> verifyPhone(phoneNo) async {
//    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
//      AuthService().signIn(authResult);
//    };
//
//    final PhoneVerificationFailed verificationfailed =
//        (AuthException authException) {
//      print('${authException.message}');
//    };
//
//    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
//      this.verificationId = verId;
//      setState(() {
//        this.codeSent = true;
//      });
//    };
//
//    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
//      this.verificationId = verId;
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: phoneNo,
//        timeout: const Duration(seconds: 5),
//        verificationCompleted: verified,
//        verificationFailed: verificationfailed,
//        codeSent: smsSent,
//        codeAutoRetrievalTimeout: autoTimeout);
//  }
//}
//    print("inside");
//    final screenSize = MediaQuery.of(context).size;
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          SizedBox(
//            height: 60,
//          ),
////          Image.asset('assets/img/payana.png'),
//          Container(
//            child: Padding(
//              padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text('Enter Mobile Number', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
//                  TextField(
//                    decoration: InputDecoration(
////                            hintText: 'Mobile Number',
////                            labelText: 'Mobile Nuumber',
//                        suffixIcon: Icon(Icons.phone, color: Color(0xff38b7e0),)
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(left: 20, right: 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                  Text('Remembe', style: TextStyle(color: Colors.grey),),
//                RaisedButton(
//                  onPressed: () => _showDialog(context),
//                  child: Text('Verify', style: TextStyle(color: Colors.white),),
//                  elevation: 10,
//                  color: Colors.indigo,
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//class Otp extends StatefulWidget {
//  @override
//  _OtpState createState() => _OtpState();
//}
//
//class _OtpState extends State<Otp> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
////      appBar: ,
//      body: Column(
//        children: <Widget>[
////          Image.asset('assets/img/payana.png'),
//          Container(
//            child: Padding(
//              padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  IconButton(icon: Icon(
//                      Icons.arrow_back_ios
//                  ), onPressed: (){
//                    Navigator.pushNamed(context, 'mob');
//                  }),
//                  SizedBox(height: 35,),
//                  Text('OTP', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
//                  TextField(
//                    decoration: InputDecoration(
////                            hintText: 'Mobile Number',
////                            labelText: 'Mobile Nuumber',
//                        suffixIcon: Icon(Icons.verified_user , color: Color(0xff38b7e0),)
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(left: 20, right: 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                  Text('Remembe', style: TextStyle(color: Colors.grey),),
//                RaisedButton(
//                  onPressed: (){
//                    Navigator.pushNamed(context, 'home');
//                  },
//                  child: Text('Verify', style: TextStyle(color: Colors.white),),
//                  elevation: 10,
//                  color: Colors.indigo,
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//                ),
//              ],
//            ),
//
//          ),
//          SizedBox(height: 80,),
//          Container(
//            child: Image(
//              fit: BoxFit.fill,
//              image: AssetImage('assets/otp.png'),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
////
//void _showDialog(context) {
//  // flutter defined function
//  showDialog(
//    context: context,
//    builder: (BuildContext context) {
//      // return object of type Dialog
//      return AlertDialog(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
//        contentPadding: EdgeInsets.all(20),
//        title: new Text("Otp Sent"),
//        actions: <Widget>[
//          // usually buttons at the bottom of the dialog
//          new FlatButton(
//            child: new Text("ok",
//            style: TextStyle(fontSize: 20),),
//            onPressed: () {
//              Navigator.of(context).pop();
//              Navigator.pushNamed(context, 'otp');
//            },
//          ),
//        ],
//      );
//    },
//  );
//}