import 'package:contactsapp/core/helpers/constants.dart';
import 'package:contactsapp/core/helpers/database_helper.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  late Database _db;
  setUp(() async {
    _db = await DatabaseHelper().initDb();
  });

  var itemToInsert = ContactInfoModel(
      id: 1, name: 'Abraham', phoneNumber: '809-532-5315', address: 'Calle B');

  group('Testing operations in database', () {
    test('Insert into database', () async {
      await _db.insert(Constants.tableName, itemToInsert.toDbMap());
    });

    test('Get items from database', () async {
      List<ContactInfoModel> contactsList = [];

      var listContacts = await _db.query(Constants.tableName);

      for (var item in listContacts) {
        contactsList.add(ContactInfoModel.fromDbMap(item));
      }
      expect(contactsList, isNotNull);
    });
  });
}
