import 'package:contactsapp/feature/contacts/domain/entities/contact_info.dart';

class ContactInfoModel extends ContactInfo {
  const ContactInfoModel(
      {int? id,
      required String name,
      required String phoneNumber,
      required String address})
      : super(id: id, name: name, phoneNumber: phoneNumber, address: address);

  factory ContactInfoModel.fromDbMap(Map<String, dynamic> map) {
    return ContactInfoModel(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toDbMap() {
    return {'name': name, 'phoneNumber': phoneNumber, 'address': address};
  }
}
