import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellocock/constants.dart';

import 'package:hellocock/screens/map/components/panel.dart';

import 'package:hellocock/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(37.550484, 127.073810);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // GoogleMap(
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 15,
          //   ),
          // ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Colors.grey[200],
          ),
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
}
