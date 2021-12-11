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
  Future<Either<Failure, int>> writeContact(ContactInfo contactInfo) async {
    return Right(await contactInfoLocalDataSource
        .writeContact(contactInfo as ContactInfoModel));
  }

  @override
  Future<Either<Failure, ContactInfo>> getContactById(int? id) async {
    return Right(await contactInfoLocalDataSource.getContactById(id));
  }

  @override
  Future<Either<Failure, List<ContactInfo>>> getContacts() async {
    return Right(await contactInfoLocalDataSource.getContacts());
  }

  @override
  Future<Either<Failure, int>> updateContact(int? id) async {
    return Right(await contactInfoLocalDataSource.updateContact(id));
  }
}
