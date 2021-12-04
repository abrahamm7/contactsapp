import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:flutter/widgets.dart';

class ShowContactsProvider extends ChangeNotifier {
  List<ContactInfoModel> _listContacts = [];
  List<ContactInfoModel> get listContacts => _listContacts;

  void getAllContacts() async {
    ContactInfoLocalDataSourceImpl contactRepositoryImpl =
        ContactInfoLocalDataSourceImpl();
    _listContacts = await contactRepositoryImpl.getContacts();
    notifyListeners();
  }

  Future<int> writeNewContact(
      String name, String phoneNumber, String address) async {
    ContactInfoLocalDataSourceImpl contactRepositoryImpl =
        ContactInfoLocalDataSourceImpl();
    var contact = ContactInfoModel(
        name: name, phoneNumber: phoneNumber, address: address);
    return contactRepositoryImpl.writeContact(contact);
  }
}
