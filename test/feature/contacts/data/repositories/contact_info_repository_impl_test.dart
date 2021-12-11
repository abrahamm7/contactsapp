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

  group('Local data source', () {
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
      int idContact = 1;

      when(mockContactInfoLocalDatasource.updateContact(idContact))
          .thenAnswer((_) async => affectedRows);

      //act
      final result = await contactRepositoryImpl.updateContact(idContact);

      //assert
      expect(result, Right(affectedRows));
    });
  });
}
