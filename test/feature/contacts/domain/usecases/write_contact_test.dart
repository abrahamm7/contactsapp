import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/write_contact.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactRepository extends Mock implements ContactRepository {}

void main() {
  late WriteContact usecase;
  late MockContactRepository mockContactRepository;
  setUp(() {
    mockContactRepository = MockContactRepository();
    usecase = WriteContact(mockContactRepository);
  });

  test('Get id inserted on localdatabase', () async {
    //arrange
    int idRow = 1;
    ContactInfo contactInfo = const ContactInfo(
        id: 1,
        name: 'Abraham',
        address: 'Bella vista',
        phoneNumber: '809-532-5315');

    when(mockContactRepository.writeContact(contactInfo))
        .thenAnswer((_) async => Right(idRow));
    //act
    final result = await usecase.call(contactInfo);

    //assert
    expect(result, Right(idRow));
    verify(mockContactRepository.writeContact(contactInfo));
    verifyNoMoreInteractions(mockContactRepository);
  });
}
