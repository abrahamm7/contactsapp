import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/core/usecases/usecases.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';

class WriteContact implements UseCases<int, ContactInfo> {
  final ContactRepository contactRepository;

  WriteContact(this.contactRepository);
  @override
  Future<Either<Failure, int>> call(ContactInfo params) async {
    return await contactRepository.writeContact(params);
  }
}
