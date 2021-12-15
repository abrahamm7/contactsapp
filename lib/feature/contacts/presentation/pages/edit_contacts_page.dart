import 'package:avatar_glow/avatar_glow.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/presentation/providers/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';

class EditContact extends StatefulWidget {
  final int? id;
  final String? nameContact;
  final String? phoneContact;
  final String? addressContact;
  const EditContact(
      {Key? key,
      this.id,
      this.nameContact,
      this.addressContact,
      this.phoneContact})
      : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _contactUpdateForm = GlobalKey<FormState>();
  final contactNameController = TextEditingController();
  final contactPhoneController = TextEditingController();
  final contactAddressController = TextEditingController();

  static const String VALIDATE_TEXT = 'Este campo es obligatorio';
  List<ContactInfoModel> listContacts = [];

  @override
  void initState() {
    contactNameController.text = "${widget.nameContact}";
    contactPhoneController.text = "${widget.phoneContact}";
    contactAddressController.text = "${widget.addressContact}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactsProvider>(
        create: (context) => sl<ContactsProvider>(),
        child: Consumer<ContactsProvider>(
            builder: (context, contactsProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit contact'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _contactUpdateForm,
                child: Column(children: <Widget>[
                  TextFormField(
                      controller: contactNameController,
                      decoration:
                          const InputDecoration(hintText: 'Contact name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return VALIDATE_TEXT;
                        }
                      }),
                  const SizedBox(height: 40),
                  TextFormField(
                      controller: contactPhoneController,
                      decoration:
                          const InputDecoration(hintText: 'Phone number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return VALIDATE_TEXT;
                        }
                      }),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: contactAddressController,
                    decoration: const InputDecoration(hintText: 'Address Line'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return VALIDATE_TEXT;
                      }
                    },
                  ),
                ]),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                context.read<ContactsProvider>().updateContact(
                    widget.id,
                    contactNameController.text,
                    contactPhoneController.text,
                    contactAddressController.text);
                Navigator.pop(context, true);
              },
              child: const AvatarGlow(child: Icon(Icons.edit), endRadius: 60.0),
            ),
          );
        }));
  }
}
