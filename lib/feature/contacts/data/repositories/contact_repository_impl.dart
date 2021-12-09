import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactInfoLocalDataSource contactInfoLocalDataSource;

  ContactRepositoryImpl({required this.contactInfoLocalDataSource});

  @override
  Future<Either<Failure, int>> writeContact(ContactInfo contactInfo) {
    // TODO: implement getContactById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ContactInfo>> getContactById(int? id) {
    // TODO: implement getContactById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ContactInfo>>> getContacts() {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

  // @override
  // Future<ContactInfo> getContactById(int id) {
  //   return contactInfoLocalDataSource.getContactById(id);
  // }
}
