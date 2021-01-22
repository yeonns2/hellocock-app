import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hellocock/screens/map/components/store_panel.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(37.54658, 127.07564)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          _googleMap(context),
          StorePanel(),
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(37.54658, 127.07564), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(allMarkers),
      ),
    );
  }
}
