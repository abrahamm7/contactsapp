import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/get_contacts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactRepository extends Mock implements ContactRepository {}

void main() {
  late GetContacts usecase;
  late MockContactRepository mockContactRepository;
  setUp(() {
    mockContactRepository = MockContactRepository();
    usecase = GetContacts(mockContactRepository);
  });

  test('Get all contacts from database', () async {
    //arrange
    List<ContactInfo> contactList = [];

    when(mockContactRepository.getContacts())
        .thenAnswer((_) async => Right(contactList));

    //act
    final result = await usecase.call(NoParams());

    //assert
    expect(result, Right(contactList));
  });
}
