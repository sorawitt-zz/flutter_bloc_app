import 'package:bloc_contact_app/src/blocs/contact_provider.dart';
import 'package:bloc_contact_app/src/models/contact.dart';
import 'package:bloc_contact_app/src/screens/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ContactsProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
        body: StreamBuilder<List<Contact>>(
      stream: bloc.contacts,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(snapshot.data[index].name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle: Text(snapshot.data[index].company.name, style: TextStyle(fontStyle: FontStyle.italic),),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ContactPage(contact: snapshot.data[index])));
              },
            );
          },
        );
      },
    ));
  }
}
