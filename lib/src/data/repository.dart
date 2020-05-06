
import 'package:bloc_contact_app/src/data/jsonplaceholder_provider.dart';
import 'package:bloc_contact_app/src/models/contact.dart';

class Repository {
  final JsonPlaceHolderProvider jsonProvider = JsonPlaceHolderProvider();

  Future<List<Contact>> fetchContacts() async => await jsonProvider.fetchContacts();
}