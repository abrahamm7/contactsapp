import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';

abstract class ContactInfoLocalDataSource {
  Future<int> writeContact(ContactInfoModel contactInfoModel);
  Future<List<ContactInfoModel>> getContacts();
  Future<ContactInfoModel> getContactById(int? id);
  Future<int> updateContact(int? id);
}
