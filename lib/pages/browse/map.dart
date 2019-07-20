import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lost_found_app/models/items.dart';

class ItemsMap extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<ItemsMap> {
  final Map<String, Marker> _markers = {};
  final List<Item> _items = [];

  GoogleMapController mapController;

  final LatLng _center = const LatLng(43.071545, -89.406642);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _buildMarkersFromFirestore().then(_buildMarkersFromItems);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
      markers: _markers.values.toSet(),
    );
  }

  Future<void> _buildMarkersFromFirestore() => Firestore.instance
          .collection('items')
          .getDocuments()
          .then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((doc) {
          this._items.add(Item.fromDocument(doc));
        });
      }).catchError((e) {
        print('Error getting documents: $e');
      });

  void _buildMarkersFromItems(_) {
    this._markers.clear();
    this._items.forEach((Item item) {
      setState(() {
        this._markers.addAll({
          item.uid: Marker(
            markerId: MarkerId(item.uid),
            position: LatLng(
                item.foundLocation.latitude, item.foundLocation.longitude),
            infoWindow: InfoWindow(
              title: item.title,
              snippet: item.description,
            ),
          ),
        });
      });
    });
  }
}
