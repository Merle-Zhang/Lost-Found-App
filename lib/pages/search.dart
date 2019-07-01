import 'package:flutter/material.dart';
import 'package:lost_found_app/services/authentication.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.auth, this.userId}) : super(key: key);

  final BaseAuth auth;
  final String userId;

  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: Text('Search'),
    );
  }
}
