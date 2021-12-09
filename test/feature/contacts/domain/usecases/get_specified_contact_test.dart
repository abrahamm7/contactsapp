import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/get_specified_contact.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactRepository extends Mock implements ContactRepository {}

void main() {
  late GetSpecifiedContact usecase;
  late MockContactRepository mockContactRepository;
  setUp(() {
    mockContactRepository = MockContactRepository();
    usecase = GetSpecifiedContact(mockContactRepository);
  });

  test('Get a specify contact from repository', () async {
    //arrange
    int idContact = 1;
    ContactInfo contact = const ContactInfo(
        name: 'Abraham', phoneNumber: '809-532-5315', address: 'Bella Vista');

    when(mockContactRepository.getContactById(any))
        .thenAnswer((_) async => Right(contact));
    //act
    final result = await usecase.call(idContact);

    //assert
    expect(result, Right(contact));
    verify(mockContactRepository.getContactById(idContact));
    verifyNoMoreInteractions(mockContactRepository);
  });
}
