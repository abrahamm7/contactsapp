import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';

abstract class ContactRepository {
  Future<int> writeContact(ContactInfo contactInfo);
  Future<List<ContactInfo>> getContacts();
}
