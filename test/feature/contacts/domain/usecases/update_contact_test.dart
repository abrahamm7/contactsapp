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
    int idRow = 1;

    when(mockContactRepository.updateContact(any))
        .thenAnswer((_) async => Right(idRow));
    //act
    final result = await usecase.call(idRow);

    //assert
    expect(result, Right(idRow));
    verify(mockContactRepository.updateContact(idRow));
    verifyNoMoreInteractions(mockContactRepository);
  });
}
