import 'package:contactsapp/core/helpers/error/exeptions.dart';
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
    try {
      return Right(await contactInfoLocalDataSource
          .writeContact(contactInfo as ContactInfoModel));
    } on CacheExeptions {
      return Left(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, ContactInfo>> getContactById(int? id) async {
    try {
      return Right(await contactInfoLocalDataSource.getContactById(id));
    } on CacheExeptions {
      return Left(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, List<ContactInfo>>> getContacts() async {
    try {
      return Right(await contactInfoLocalDataSource.getContacts());
    } on CacheExeptions {
      return Left(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, int>> updateContact(ContactInfo contactInfo) async {
    try {
      return Right(await contactInfoLocalDataSource
          .updateContact(contactInfo as ContactInfoModel));
    } on CacheExeptions {
      return Left(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, int>> deleteContact(int? id) async {
    try {
      return Right(await contactInfoLocalDataSource.deleteContact(id));
    } on CacheExeptions {
      return Left(CacheFailures());
    }
  }
}
