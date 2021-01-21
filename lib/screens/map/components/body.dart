import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hellocock/screens/map/components/store_panel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          _googleMap(context),
          // Container(
          //   width: SizeConfig.screenWidth,
          //   height: SizeConfig.screenHeight,
          //   color: Colors.grey[200],
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: SizedBox(
          //     height: 50,
          //     child: TextField(
          //       style: TextStyle(fontSize: 15),
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         suffixIcon: Icon(
          //           Icons.search,
          //           color: kActiveColor,
          //           size: 20,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
            CameraPosition(target: LatLng(37.550484, 127.073810), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
