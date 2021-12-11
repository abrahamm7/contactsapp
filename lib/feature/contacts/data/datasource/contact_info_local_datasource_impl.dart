import 'package:contactsapp/core/helpers/constants.dart';
import 'package:contactsapp/core/helpers/database_helper.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactInfoLocalDataSourceImpl implements ContactInfoLocalDataSource {
  @override
  Future<List<ContactInfoModel>> getContacts() async {
    Database _db = await DatabaseHelper().initDb();
    var resultQuery = await _db.query(Constants.tableName);
    List<ContactInfoModel> listContacts = [];

    for (var item in resultQuery) {
      listContacts.add(ContactInfoModel.fromDbMap(item));
    }
    return listContacts;
  }

  @override
  Future<int> writeContact(ContactInfoModel contactInfoModel) async {
    Database _db = await DatabaseHelper().initDb();
    return await _db.insert(Constants.tableName, contactInfoModel.toDbMap());
  }

  @override
  Future<ContactInfoModel> getContactById(int? id) async {
    Database _db = await DatabaseHelper().initDb();
    List<ContactInfoModel> listContacts = [];
    var resultQuery =
        await _db.query(Constants.tableName, where: 'id = ?', whereArgs: [id]);

    for (var item in resultQuery) {
      listContacts.add(ContactInfoModel.fromDbMap(item));
    }
    return listContacts.first;
  }

  @override
  Future<int> updateContact(ContactInfoModel contactInfo) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
