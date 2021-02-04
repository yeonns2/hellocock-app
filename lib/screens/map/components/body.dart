import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hellocock/screens/map/components/store_panel.dart';

class Body extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;
  Body(this.user, this.document);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        infoWindow: InfoWindow(title: "궤도에 오르다", snippet: "광진구 군자동 465-17"),
        position: LatLng(37.54658, 127.07564)));
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        infoWindow: InfoWindow(title: "모히또 하우스", snippet: "광진구 군자동 465-17"),
        position: LatLng(37.557433, 127.073604)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Opacity(opacity: 0.8, child: _googleMap(context)),
          StorePanel(widget.user, widget.document),
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
