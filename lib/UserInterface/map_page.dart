// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MapPage());
}

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(-25.783602670969653, 28.335792636819498),
            //-25.783602670969653, 28.335792636819498
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://api.mapbox.com/styles/v1/theolinnaidoo/cl17xbsf7005015lj5oh12ezl/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGhlb2xpbm5haWRvbyIsImEiOiJjbDE3djd6ejcwN3FsM2NvNGdmMGFwZzN3In0.cKJRbP39WngD5JNwsphF-g",
              additionalOptions: {
                'accessToken' : 'pk.eyJ1IjoidGhlb2xpbm5haWRvbyIsImEiOiJjbDE3djd6ejcwN3FsM2NvNGdmMGFwZzN3In0.cKJRbP39WngD5JNwsphF-g',
                'id' : 'mapbox.mapbox-streets-v8'
              },
              attributionBuilder: (_) {
                return Text("© OpenStreetMap contributors");
              },
            ),
           /* MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(37.4217432, -122.0841487),
                  builder: (ctx) =>
                     /* Container(
                        child: FlutterLogo(),
                      ),*/
                ),
              ],
            ),*/
          ],
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}