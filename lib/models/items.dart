import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  Item({
    @required this.uid,
    @required this.title,
    @required this.category,
    @required this.description,
    @required this.foundLocation,
    @required this.foundTime,
    @required this.posterUid,
    @required this.updated,
    @required this.created,
    @required this.claimed,
  });

  Item.fromDocument(DocumentSnapshot document)
      : uid = document.documentID,
        title = document['title'],
        category = _buildCategoryFromString(document['category']),
        description = document['destription'],
        foundLocation = document['foundLocation'],
        foundTime = document['foundTime'],
        posterUid = document['posterUid'],
        updated = document['updated'],
        created = document['created'],
        claimed = document['claimed'];

  final String uid;
  final String title;
  final Category category;
  final String description;
  final GeoPoint foundLocation;
  final Timestamp foundTime;
  // TODO Photos and/or videos
  final String posterUid;
  final Timestamp updated;
  final Timestamp created;
  final bool claimed;

  static Category _buildCategoryFromString(String strCat) {
    strCat = strCat.replaceAll(' ', '').toLowerCase();
    switch (strCat) {
      case 'book':
        return Category.book;
        break;
      case 'key':
        return Category.key;
        break;
      default:
        return Category.undefined;
    }
  }
}

enum Category {
  book,
  key,
  undefined,
}
