import 'package:contactsapp/core/helpers/constants.dart';
import 'package:contactsapp/core/helpers/database_helper.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactInfoLocalDataSourceImpl implements ContactInfoLocalDataSource {
  late Database database;
  @override
  Future<List<ContactInfoModel>> getContacts() async {
    return fetchAllContactsFromLocalDb();
  }

  @override
  Future<int> writeContact(ContactInfoModel contactInfoModel) async {
    return insertContactIntoLocalDb(contactInfoModel);
  }

  @override
  Future<ContactInfoModel> getContactById(int? id) async {
    return fetchConcreteContact(id);
  }

  @override
  Future<int> updateContact(ContactInfoModel contactInfo) async {
    return await updateContactIntoLocalDatabase(contactInfo);
  }

  Future<List<ContactInfoModel>> fetchAllContactsFromLocalDb() async {
    database = await DatabaseHelper().initDb();

    var queryResult = await database.query(Constants.tableName);

    List<ContactInfoModel> listContacts = [];

    for (var element in queryResult) {
      listContacts.add(ContactInfoModel.fromDbMap(element));
    }

    return listContacts;
  }

  Future<ContactInfoModel> fetchConcreteContact(int? id) async {
    database = await DatabaseHelper().initDb();

    List<ContactInfoModel> listContacts = [];

    var queryResult = await database
        .query(Constants.tableName, where: 'id = ?', whereArgs: [id]);

    for (var item in queryResult) {
      listContacts.add(ContactInfoModel.fromDbMap(item));
    }

    return listContacts.first;
  }

  Future<int> insertContactIntoLocalDb(
      ContactInfoModel contactInfoModel) async {
    database = await DatabaseHelper().initDb();
    return await database.insert(
        Constants.tableName, contactInfoModel.toDbMap());
  }

  Future<int> updateContactIntoLocalDatabase(
      ContactInfoModel contactInfoModel) async {
    database = await DatabaseHelper().initDb();
    return await database.update(
        Constants.tableName, contactInfoModel.toDbMap(),
        where: "id = ?", whereArgs: [contactInfoModel.id]);
  }
}
