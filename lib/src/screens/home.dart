import 'package:bloc_contact_app/src/blocs/contact_provider.dart';
import 'package:bloc_contact_app/src/models/contact.dart';
import 'package:bloc_contact_app/src/screens/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final bloc = ContactsProvider.of(context);
      bloc.fetchContacts();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final bloc = ContactsProvider.of(context);
    return Scaffold(
        body: StreamBuilder<List<Contact>>(
      stream: bloc.contacts,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactPage(contact: snapshot.data[index])));
              },
            );
          },
        );
      },
    ));
  }
}