import 'package:equatable/equatable.dart';

class ContactInfo extends Equatable {
  final int? id;
  final String name;
  final String phoneNumber;
  final String address;

  const ContactInfo(
      {this.id,
      required this.name,
      required this.phoneNumber,
      required this.address});

  @override
  List<Object?> get props => [name, phoneNumber, address];
}
