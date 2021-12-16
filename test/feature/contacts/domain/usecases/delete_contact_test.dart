import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/delete_contact.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockContactRepository extends Mock implements ContactRepository {}

void main() {
  late DeleteContact usecase;
  late MockContactRepository mockContactRepository;

  setUp(() {
    mockContactRepository = MockContactRepository();
    usecase = DeleteContact(mockContactRepository);
  });

  test('Should return deleted row from local database', () async {
    //arrange
    int idRow = 1;

    when(mockContactRepository.deleteContact(any))
        .thenAnswer((_) async => Right(idRow));

    //act
    final result = await mockContactRepository.deleteContact(idRow);

    //assert
    expect(result, Right(idRow));
  });
}
