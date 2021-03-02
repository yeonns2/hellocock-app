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
  var latitude;
  var longitude;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('store').get().then((store) {
      if (store.docs.isNotEmpty) {
        for (int i = 0; i < store.docs.length; i++) {
          setState(() {
            allMarkers.add(Marker(
                markerId: MarkerId(store.docs[i]['name']),
                draggable: true,
                infoWindow: InfoWindow(
                    title: store.docs[i]['name'],
                    snippet: store.docs[i]['address']),
                position: LatLng(store.docs[i]['location'].latitude.toDouble(),
                    store.docs[i]['location'].longitude.toDouble())));
          });
        }
      }
    });
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
