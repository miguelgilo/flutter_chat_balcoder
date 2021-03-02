import 'package:flutter/material.dart';
import 'package:flutter_chat__balcoder/ui/contact/model/contact_model.dart';

import 'contact_service.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  ContactService _contactService = new ContactService();
  List<ContactModel> _contactList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _contactService.addContact(new ContactModel(
    //     contactName: "NOMBRE DEL CONTACTO", phoneNumber: "3214324324"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _contactService.contactCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());

              break;
            default:
              snapshot.data.docs.forEach((doc) {
                _contactList.add(new ContactModel.fromSnapshot(doc));
              });
              return ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_contactList[index].contactName),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
