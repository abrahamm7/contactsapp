import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var contactModel =
      const ContactInfoModel(id: 1, name: '', phoneNumber: '', address: '');

  test('Test model are equal to entities', () {
    expect(contactModel, isA<ContactInfo>());
  });
}
