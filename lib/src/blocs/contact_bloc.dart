import 'package:rxdart/subjects.dart';
import '../models/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ContactsBloc {
  final _contacts = BehaviorSubject<List<Contact>>();

  // Get data
  Stream<List<Contact>> get contacts => _contacts.stream;

  // Set data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose() {
    _contacts.close();
  }

    Future<void> fetchContacts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    var jsonResponse = convert.jsonDecode(response.body);
    var contactsJson = jsonResponse as List;
    List<Contact> contacts = contactsJson.map((contact) => Contact.fromJson(contact)).toList();

    changeContacts(contacts);
  }
}