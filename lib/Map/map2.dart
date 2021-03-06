library google_maps_place_picker;

export 'package:sidebaranimationflutter/src/models/pick_result.dart';
export 'package:sidebaranimationflutter/src/components/floating_card.dart';
export 'package:sidebaranimationflutter/src/components/rounded_frame.dart';
export 'package:sidebaranimationflutter/src/place_picker.dart';



//import 'dart:math';
//
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';
//import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'map.dart';
//
//class DeliveryScreen extends StatefulWidget with NavigationStates{
//  final LatLng fromPoint = LatLng(-38.956176, -67.920666);
//  final LatLng toPoint = LatLng(-38.953724, -67.923921);
//
//  @override
//  _DeliveryScreenState createState() => _DeliveryScreenState();
//}
//
//class _DeliveryScreenState extends State<DeliveryScreen> {
//  GoogleMapController _mapController;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: new Center(
//        child: new RaisedButton(
//          onPressed: _launchURL,
//          child: new Text('Launch Maps'),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.zoom_out_map),
//        onPressed: _centerView,
//      ),
//    );
//  }
//  _launchURL() async {
//    const url = "https://www.google.com/maps/search/?api=1&query=-38.956176,-67.920666,17&query_place_id=PLACE_ID";
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch Maps';
//    }
//  }
//  Set<Marker> _createMarkers() {
//    var tmp = Set<Marker>();
//
//    tmp.add(
//      Marker(
//        markerId: MarkerId("fromPoint"),
//        position: widget.fromPoint,
//        infoWindow: InfoWindow(title: "Pizzeria"),
//      ),
//    );
//    tmp.add(
//      Marker(
//        markerId: MarkerId("toPoint"),
//        position: widget.toPoint,
//        infoWindow: InfoWindow(title: "Roca 123"),
//      ),
//    );
//    return tmp;
//  }
//
//  void _onMapCreated(GoogleMapController controller) {
//    _mapController = controller;
//
//    _centerView();
//  }
//
//  _centerView() async {
//    var api = Provider.of<DirectionProvider>(context);
//
//    await _mapController.getVisibleRegion();
//
//    print("buscando direcciones");
//    await api.findDirections(widget.fromPoint, widget.toPoint);
//
//    var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
//    var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
//    var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
//    var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);
//
//    api.currentRoute.first.points.forEach((point) {
//      left = min(left, point.latitude);
//      right = max(right, point.latitude);
//      top = max(top, point.longitude);
//      bottom = min(bottom, point.longitude);
//    });
//
//    var bounds = LatLngBounds(
//      southwest: LatLng(left, bottom),
//      northeast: LatLng(right, top),
//    );
//    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
//    _mapController.animateCamera(cameraUpdate);
//  }
//}