import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';

class GetSpecifiedContact implements UseCases<ContactInfo, int> {
  final ContactRepository contactRepository;

  GetSpecifiedContact(this.contactRepository);

  @override
  Future<Either<Failure, ContactInfo>> call(int id) async {
    return await contactRepository.getContactById(id);
  }
}
