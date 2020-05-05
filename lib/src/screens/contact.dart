import 'package:flutter/material.dart';
import 'package:bloc_contact_app/src/models/contact.dart';

class ContactPage extends StatelessWidget {
  final Contact contact;

  ContactPage({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: ListView(children: <Widget>[
        ListTile(leading: Icon(Icons.email), trailing: Text(contact.email),),
        ListTile(leading: Icon(Icons.person), trailing: Text(contact.username),)
      ],),
    );
  }
}