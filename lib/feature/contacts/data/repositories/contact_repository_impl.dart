import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactInfoLocalDataSource contactInfoLocalDataSource;

  ContactRepositoryImpl({required this.contactInfoLocalDataSource});

  @override
  Future<List<ContactInfo>> getContacts() {
    return contactInfoLocalDataSource.getContacts();
  }

  @override
  Future<int> writeContact(ContactInfo contactInfo) {
    return contactInfoLocalDataSource
        .writeContact(contactInfo as ContactInfoModel);
  }
}
