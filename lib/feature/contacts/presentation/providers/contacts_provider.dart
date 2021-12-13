import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/write_contact.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier {
  final WriteContact writeContact;
  final ContactRepository contactRepository;
  final int = 0;

  ContactsProvider(this.writeContact, this.contactRepository);

  void writeNewContact(String name, String phoneNumber, String address) async {
    var contact = ContactInfoModel(
        name: name, phoneNumber: phoneNumber, address: address);
    writeContact.call(contact);
  }
}
