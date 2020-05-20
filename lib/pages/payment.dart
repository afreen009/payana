import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_upi/flutter_upi.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';



class Payment extends StatefulWidget with NavigationStates{
  final amount;
  Payment({@required this.amount});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  Future _initiateTransaction;
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    //_initiateTransaction = initTransaction();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<String> initTransaction(String app) async {
    String response = await FlutterUpi.initiateTransaction(
        app: app,
        pa: "apoorvaagarwal@upi",
        pn: "Shifa Afreen",
        tr: "TR1234",
        tn: "This is a test transaction",
        am: widget.amount,
        cu: "INR",
        url: "https://www.google.com");
    print(response);

    return response;
  }

  @override
  Widget build(BuildContext context){
    return  SafeArea(
      child: Scaffold(
          key: _key,
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(left:10, right: 10.0),
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            10.0, // Move to right 10  horizontally
                            10.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ] ,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/paytm.png",
                              height: 30,
                              width: 100,
                            ),
                            Text("(₹ 238.90)")
                          ],
                        ),
                        Text(
                          "Linked with 8618210228",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.withOpacity(0.9)
                          ),
                        )
                      ],
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              10.0, // Move to right 10  horizontally
                              10.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ] ,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),


//        bottomNavigationBar: BottomAppBar(
//          color: Colors.blue,
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              FlatButton(
//                color: Colors.blue,
//                child: Text(
//                  "Pay Now with PayTM",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () {
//                  _initiateTransaction = initTransaction(FlutterUpiApps.PayTM);
//                  setState(() {});
//                },
//              ),
//              Divider(
//                height: 1.0,
//                color: Colors.white,
//              ),
//              FlatButton(
//                color: Colors.blue,
//                child: Text(
//                  "Pay Now with BHIM UPI",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () {
//                  _initiateTransaction =
//                      initTransaction(FlutterUpiApps.BHIMUPI);
//                  setState(() {});
//                },
//              ),
//              Divider(
//                height: 1.0,
//                color: Colors.white,
//              ),
//              FlatButton(
//                color: Colors.blue,
//                child: Text(
//                  "Pay Now with Google Pay",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () {
//                  _initiateTransaction =
//                      initTransaction(FlutterUpiApps.GooglePay);
//                  setState(() {});
//                },
//              ),
//            ],
//          ),
//        ),
        ),
    );
  }
}