import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier {
  Future<List<ContactInfoModel>> getContacts() async {
    ContactInfoLocalDataSourceImpl contactRepositoryImpl =
        ContactInfoLocalDataSourceImpl();
    notifyListeners();
    return await contactRepositoryImpl.getContacts();
  }

  Future<int> writeNewContact(
      String name, String phoneNumber, String address) async {
    ContactInfoLocalDataSourceImpl contactRepositoryImpl =
        ContactInfoLocalDataSourceImpl();
    try {
      var contact = ContactInfoModel(
          name: name, phoneNumber: phoneNumber, address: address);
      return contactRepositoryImpl.writeContact(contact);
    } catch (e) {
      return 0;
    }
  }
}
