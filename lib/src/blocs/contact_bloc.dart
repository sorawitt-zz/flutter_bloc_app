import 'package:rxdart/subjects.dart';
import '../models/contact.dart';

class ContactsBloc {
  final _contacts = BehaviorSubject<List<Contact>>();

  // Get data
  Stream<List<Contact>> get contacts => _contacts.stream;

  // Set data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose() {
    _contacts.close();
  }
}