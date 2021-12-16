import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepository {
  Future<Either<Failure, int>> writeContact(ContactInfo contactInfo);
  Future<Either<Failure, int>> updateContact(ContactInfo contactInfo);
  Future<Either<Failure, List<ContactInfo>>> getContacts();
  Future<Either<Failure, ContactInfo>> getContactById(int? id);
  Future<Either<Failure, int>> deleteContact(int? id);
}
