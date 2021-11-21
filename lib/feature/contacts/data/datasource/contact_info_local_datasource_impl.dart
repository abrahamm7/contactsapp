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
  void writeContact(ContactInfoModel contactInfoModel) async {
    Database? _db = await DatabaseHelper().initDb();
    _db?.insert(Constants.tableName, contactInfoModel.toDbMap());
  }
}
