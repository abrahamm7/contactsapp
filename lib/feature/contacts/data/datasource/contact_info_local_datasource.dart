import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';

abstract class ContactInfoLocalDataSource {
  void writeContact(ContactInfoModel contactInfoModel);
  Future<List<ContactInfoModel>> getContacts();
}
