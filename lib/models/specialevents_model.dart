import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SpecialEvent {
  String? _title;
  String? _description;
  Timestamp? _date;
  TimeOfDay? _time;
  String _location='';
  String? _imageURL;

  SpecialEvent(
      {String? title,
        String? description,
        Timestamp? date,
        TimeOfDay? time,
        String? location, String? imageURL}) {
    if (title != null) {
      this._title = title;
    }

    if (description != null) {
      this._description = description;
    }
    if (date != null) {
      this._date = date;
    }
    if (time != null) {
      this._time = time;
    }
    if (location != null) {
      this._location = location;
    }
    if (imageURL != null) {
      this._imageURL = imageURL;
    }
  }

  String? get title => _title;
  set name(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  Timestamp? get date => _date;
  set date(Timestamp? date) => _date = date;
  TimeOfDay? get time => _time;
  set time(TimeOfDay? time) => _time = time;
  String get location => _location;
  set location(String? location) => _location = location!;
  String? get imageURL => _imageURL;
  set imageURL (String? imageURL) => _imageURL = imageURL;

  SpecialEvent.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
    _date = json['date'];
   _time=json['time'];
    _location = json['location'];
    _imageURL=json['imageURL'];

  }


}