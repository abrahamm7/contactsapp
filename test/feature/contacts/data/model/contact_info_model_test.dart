import 'dart:convert';

import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/fixture/fixture.dart';

void main() {
  const contactModel = ContactInfoModel(
      id: 1,
      name: 'Abraham',
      phoneNumber: '809-532-5315',
      address: 'Bella Vista');

  test('Test model is a subclass of entities', () {
    //assert
    expect(contactModel, isA<ContactInfo>());
  });

  group('Contact info fromdbmap', () {
    test('Should return same structure like model', () {
      //arrange
      final Map<String, dynamic> dbMap =
          jsonDecode(fixture('contact_db_map.json'));
      //act
      final result = ContactInfoModel.fromDbMap(dbMap);
      //assert
      expect(result, contactModel);
    });
  });

  group('Contact info todbmap', () {
    test('Should encode json', () {
      //arrange
      var jsonEncoded = {
        "name": "Abraham",
        "phoneNumber": "809-532-5315",
        "address": "Bella Vista"
      };
      //act
      final result = contactModel.toDbMap();
      //assert
      expect(result, jsonEncoded);
    });
  });
}
