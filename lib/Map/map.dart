import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sidebaranimationflutter/bloc/navigation_block/navigation_bloc.dart';

// Your api key storage.
//import 'keys.dart';
import 'map2.dart';

class MapPage extends StatelessWidget with NavigationStates{
  // Light Theme
  final ThemeData lightTheme = ThemeData.light().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map Place Picker Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(13.036176, 77.620503);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PickResult selectedPlace;

  @override
  Widget build(BuildContext context) {
     return PlacePicker(
      apiKey: "AIzaSyDo-UsLxFtsbvMojG3_VARdLl-IQ6pGwbc",
      initialPosition: HomePage.kInitialPosition,
      useCurrentLocation: true,
      //usePlaceDetailSearch: true,
      onPlacePicked: (result) {
        selectedPlace = result;
        Navigator.of(context).pop();
        setState(() {});
      },
      //forceSearchOnZoomChanged: true,
      //automaticallyImplyAppBarLeading: false,
      //autocompleteLanguage: "ko",
      //region: 'au',
      //selectInitialPosition: true,
      // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
      //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
      //   return isSearchBarFocused
      //       ? Container()
      //       : FloatingCard(
      //           bottomPosition: 0.0,    // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
      //           leftPosition: 0.0,
      //           rightPosition: 0.0,
      //           width: 500,
      //           borderRadius: BorderRadius.circular(12.0),
      //           child: state == SearchingState.Searching
      //               ? Center(child: CircularProgressIndicator())
      //               : RaisedButton(
      //                   child: Text("Pick Here"),
      //                   onPressed: () {
      //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
      //                     //            this will override default 'Select here' Button.
      //                     print("do something with [selectedPlace] data");
      //                     Navigator.of(context).pop();
      //                   },
      //                 ),
      //         );
      // },
      // pinBuilder: (context, state) {
      //   if (state == PinState.Idle) {
      //     return Icon(Icons.favorite_border);
      //   } else {
      //     return Icon(Icons.favorite);
      //   }
      // },
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
//import 'package:google_maps_webservice/directions.dart';
//
//class DirectionProvider extends ChangeNotifier {
//  GoogleMapsDirections directionsApi =
//  GoogleMapsDirections(apiKey: "AIzaSyDo-UsLxFtsbvMojG3_VARdLl-IQ6pGwbc");
//
//  Set<maps.Polyline> _route = Set();
//
//  Set<maps.Polyline> get currentRoute => _route;
//
//  findDirections(maps.LatLng from, maps.LatLng to) async {
//    var origin = Location(from.latitude, from.longitude);
//    var destination = Location(to.latitude, to.longitude);
//
//    var result = await directionsApi.directionsWithLocation(
//      origin,
//      destination,
//      travelMode: TravelMode.driving,
//    );
//
//    Set<maps.Polyline> newRoute = Set();
//    print(result);
//    if (result.isOkay) {
//      var route = result.routes[0];
//      var leg = route.legs[0];
//
//      List<maps.LatLng> points = [];
//
//      leg.steps.forEach((step) {
//        points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
//        points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
//      });
//
//      var line = maps.Polyline(
//        points: points,
//        polylineId: maps.PolylineId("mejor ruta"),
//        color: Colors.red,
//        width: 4,
//      );
//      newRoute.add(line);
//
//      print(line);
//      print(line);
//      print(line);
//      _route = newRoute;
//      notifyListeners();
//    } else {
//      print("ERRROR !!! ${result.status}");
//    }
//  }
//}