import 'package:contactsapp/core/helpers/error/exeptions.dart';
import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/data/repositories/contact_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactInfoLocalDatasource extends Mock
    implements ContactInfoLocalDataSource {}

void main() {
  late ContactRepositoryImpl contactRepositoryImpl;
  late MockContactInfoLocalDatasource mockContactInfoLocalDatasource;

  setUp(() {
    mockContactInfoLocalDatasource = MockContactInfoLocalDatasource();
    contactRepositoryImpl = ContactRepositoryImpl(
        contactInfoLocalDataSource: mockContactInfoLocalDatasource);
  });

  group('Local data source interactions', () {
    test(
        'Should return contact when call get concrete contact from local data source',
        () async {
      //arrange
      int contactId = 1;
      const contactInfoModel = ContactInfoModel(
          id: 1,
          name: 'Abraham',
          phoneNumber: '809-532-5315',
          address: 'Bella Vista');

      when(mockContactInfoLocalDatasource.getContactById(any))
          .thenAnswer((_) async => contactInfoModel);

      //act
      final result = await contactRepositoryImpl.getContactById(contactId);

      //assert
      expect(result, equals(const Right(contactInfoModel)));
    });

    test(
        'Should return List of contacts when call get all contacts from local data source',
        () async {
      //arrange
      List<ContactInfoModel> listContact = [];

      when(mockContactInfoLocalDatasource.getContacts())
          .thenAnswer((_) async => listContact);

      //act
      final result = await contactRepositoryImpl.getContacts();

      //assert
      expect(result, Right(listContact));
    });

    test(
        'Should return id of inserted row when call write method from local data source',
        () async {
      //arrange
      int contactId = 1;
      const contactInfoModel = ContactInfoModel(
          name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

      when(mockContactInfoLocalDatasource.writeContact(contactInfoModel))
          .thenAnswer((_) async => contactId);

      //act
      final result = await contactRepositoryImpl.writeContact(contactInfoModel);

      //assert
      expect(result, Right(contactId));
    });

    test(
        'Should return affected rows when call update method from local data source',
        () async {
      //arrange
      int affectedRows = 1;
      const contactInfoModel = ContactInfoModel(
          name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

      when(mockContactInfoLocalDatasource.updateContact(contactInfoModel))
          .thenAnswer((_) async => affectedRows);

      //act
      final result =
          await contactRepositoryImpl.updateContact(contactInfoModel);

      //assert
      expect(result, Right(affectedRows));
    });

    test(
        'Should return affected rows when call delete method from local data source',
        () async {
      //arrange
      int affectedRows = 1;

      when(mockContactInfoLocalDatasource.deleteContact(any))
          .thenAnswer((_) async => affectedRows);

      //act
      final result = await contactRepositoryImpl.deleteContact(affectedRows);

      //assert
      expect(result, Right(affectedRows));
    });
  });

  group('Local data source failures', () {
    test(
        'Should return failure when cannot get concrete contact from local data source',
        () async {
      //arrange
      int contactId = 1;
      when(mockContactInfoLocalDatasource.getContactById(any))
          .thenThrow(CacheExeptions());

      //act
      final result = await contactRepositoryImpl.getContactById(contactId);

      //assert
      expect(result, equals(Left(CacheFailures())));
    });

    test(
        'Should return failure when cannot get a list of contacts from local data source',
        () async {
      //arrange
      when(mockContactInfoLocalDatasource.getContacts())
          .thenThrow(CacheExeptions());

      //act
      final result = await contactRepositoryImpl.getContacts();

      //assert
      expect(result, equals(Left(CacheFailures())));
    });

    test(
        'Should return failure when cannot update contact in local data source',
        () async {
      //arrange

      const contactInfoModel = ContactInfoModel(
          name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

      when(mockContactInfoLocalDatasource.updateContact(contactInfoModel))
          .thenThrow(CacheExeptions());

      //act
      final result =
          await contactRepositoryImpl.updateContact(contactInfoModel);

      //assert
      expect(result, equals(Left(CacheFailures())));
    });

    test(
        'Should return failure when cannot insert contact in local data source',
        () async {
      //arrange

      const contactInfoModel = ContactInfoModel(
          name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

      when(mockContactInfoLocalDatasource.writeContact(contactInfoModel))
          .thenThrow(CacheExeptions());

      //act
      final result = await contactRepositoryImpl.writeContact(contactInfoModel);

      //assert
      expect(result, equals(Left(CacheFailures())));
    });
  });
}
