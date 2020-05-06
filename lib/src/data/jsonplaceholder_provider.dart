import 'package:bloc_contact_app/src/models/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class JsonPlaceHolderProvider {
  Future<List<Contact>> fetchContacts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    var jsonResponse = convert.jsonDecode(response.body);
    var contactsJson = jsonResponse as List;
    List<Contact> contacts =
        contactsJson.map((contact) => Contact.fromJson(contact)).toList();

    return contacts;
  }
}
