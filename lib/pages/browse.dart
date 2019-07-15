import 'package:flutter/material.dart';
import 'package:lost_found_app/services/authentication.dart';
import 'package:lost_found_app/pages/map.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.auth, this.userId}) : super(key: key);

  final BaseAuth auth;
  final String userId;

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: Map(),
    );
  }
}
