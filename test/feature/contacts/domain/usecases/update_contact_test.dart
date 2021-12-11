import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/update_contact.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactRepository extends Mock implements ContactRepository {}

void main() {
  late UpdateContact usecase;
  late MockContactRepository mockContactRepository;
  setUp(() {
    mockContactRepository = MockContactRepository();
    usecase = UpdateContact(mockContactRepository);
  });

  test('Update contact on localdatabase', () async {
    //arrange
    int affectedRows = 1;
    const contactInfoModel = ContactInfo(
        name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

    when(mockContactRepository.updateContact(contactInfoModel))
        .thenAnswer((_) async => Right(affectedRows));
    //act
    final result = await usecase.call(contactInfoModel);

    //assert
    expect(result, Right(affectedRows));
    verify(mockContactRepository.updateContact(contactInfoModel));
    verifyNoMoreInteractions(mockContactRepository);
  });
}
