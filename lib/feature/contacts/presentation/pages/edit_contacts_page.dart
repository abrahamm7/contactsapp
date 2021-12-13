import 'package:avatar_glow/avatar_glow.dart';
import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/presentation/providers/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditContact extends StatefulWidget {
  final int? id;
  const EditContact({Key? key, this.id}) : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  ContactInfoLocalDataSourceImpl contactInfoLocalDataSourceImpl =
      ContactInfoLocalDataSourceImpl();
  final _contactUpdateForm = GlobalKey<FormState>();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController contactAddressController = TextEditingController();
  ContactInfoModel contact =
      const ContactInfoModel(address: '', name: '', phoneNumber: '');
  static const String VALIDATE_TEXT = 'Este campo es obligatorio';
  List<ContactInfoModel> listContacts = [];

  @override
  void initState() {
    getContact();
    super.initState();
  }

  Future<ContactInfoModel> getContact() async {
    int? idContact = widget.id;
    contact = await contactInfoLocalDataSourceImpl.getContactById(idContact);
    return contact;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactsProvider>(
        create: (context) => ContactsProvider(),
        child: Consumer<ContactsProvider>(
            builder: (context, contactsProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Contacts'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _contactUpdateForm,
                child: Column(children: <Widget>[
                  TextFormField(
                      controller: contactNameController,
                      initialValue: contact.name,
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
                      initialValue: contact.phoneNumber,
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
                    initialValue: contact.address,
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
                setState(() {});
              },
              child: const AvatarGlow(child: Icon(Icons.edit), endRadius: 60.0),
            ),
          );
        }));
  }
}
