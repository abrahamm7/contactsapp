import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/update_contact.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/write_contact.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier {
  final WriteContact writeContact;
  final UpdateContact editContact;
  final ContactRepository contactRepository;

  ContactsProvider(this.writeContact, this.contactRepository, this.editContact);

  void writeNewContact(String name, String phoneNumber, String address) async {
    var contact = ContactInfoModel(
        name: name, phoneNumber: phoneNumber, address: address);
    writeContact.call(contact);
  }

  void updateContact(
      int? id, String name, String phoneNumber, String address) async {
    var contact = ContactInfoModel(
        id: id, name: name, phoneNumber: phoneNumber, address: address);
    editContact.call(contact);
  }
}
