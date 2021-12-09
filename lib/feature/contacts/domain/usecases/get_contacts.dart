import 'package:contactsapp/core/helpers/error/failure.dart';
import 'package:contactsapp/core/usecases/usecases.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetContacts implements UseCases<List<ContactInfo>, NoParams> {
  final ContactRepository contactRepository;

  GetContacts(this.contactRepository);
  @override
  Future<Either<Failure, List<ContactInfo>>> call(NoParams params) async {
    return await contactRepository.getContacts();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
