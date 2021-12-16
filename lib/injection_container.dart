import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/repositories/contact_repository_impl.dart';
import 'package:contactsapp/feature/contacts/domain/repositories/contact_repository.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/delete_contact.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/get_contacts.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/get_specified_contact.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/update_contact.dart';
import 'package:contactsapp/feature/contacts/domain/usecases/write_contact.dart';
import 'package:contactsapp/feature/contacts/presentation/providers/contacts_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Provider
  sl.registerFactory(() => ContactsProvider(sl(), sl(), sl(), sl()));

  //Use cases
  sl.registerLazySingleton(() => WriteContact(sl()));
  sl.registerLazySingleton(() => GetContacts(sl()));
  sl.registerLazySingleton(() => GetSpecifiedContact(sl()));
  sl.registerLazySingleton(() => UpdateContact(sl()));
  sl.registerLazySingleton(() => DeleteContact(sl()));

  //Repositories
  sl.registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImpl(contactInfoLocalDataSource: sl()));

  //Data sources
  sl.registerLazySingleton<ContactInfoLocalDataSource>(
      () => ContactInfoLocalDataSourceImpl());
}
