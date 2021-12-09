import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/core/usecases/usecases.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateContact implements UseCases<int, int> {
  final ContactRepository contactRepository;

  UpdateContact(this.contactRepository);
  @override
  Future<Either<Failure, int>> call(int params) async {
    return await contactRepository.updateContact(params);
  }
}
