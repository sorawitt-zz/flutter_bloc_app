import 'package:bloc_contact_app/src/data/repository.dart';
import 'package:rxdart/subjects.dart';
import '../models/contact.dart';

class ContactsBloc {

  ContactsBloc() {
    _fetchContacts();
  }

  final _contacts = BehaviorSubject<List<Contact>>();
  final Repository _repository = Repository();

  // Get data
  Stream<List<Contact>> get contacts => _contacts.stream;

  // Set data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose() {
    _contacts.close();
  }

  _fetchContacts() => _repository.fetchContacts().then((contacts) => changeContacts(contacts));

}