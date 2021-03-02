import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/contact_model.dart';

class ContactService {
  final contactCollection =
      FirebaseFirestore.instance.collection('contactCollection');

  addContact(ContactModel contactModel) {
    contactCollection.add(contactModel.toJson()).then((value) {
      print("GUARDE CONTACTO");
    });
  }

  updateContact() {}
  deleteContact() {}
}
