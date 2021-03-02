import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ContactModel {
  String contactName;
  String phoneNumber;

  ContactModel({this.contactName, this.phoneNumber});

  toJson() {
    return {
      "contactName": contactName,
      "phoneNumber": phoneNumber,
    };
  }

  factory ContactModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ContactModel(
        contactName: snapshot.data()['contactName'],
        phoneNumber: snapshot.data()['phoneNumber']);
  }
}
