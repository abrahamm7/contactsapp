import 'package:contactsapp/feature/contacts/presentation/providers/show_contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({Key? key}) : super(key: key);

  @override
  _CreateContactState createState() => _CreateContactState();
}

final _contactKeyForm = GlobalKey<FormState>();

class _CreateContactState extends State<CreateContact> {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController contactAddressController = TextEditingController();
  static const String VALIDATE_TEXT = 'Este campo es obligatorio';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowContactsProvider>(
        create: (context) => ShowContactsProvider(),
        child:
            Consumer<ShowContactsProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New contact'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _contactKeyForm,
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
                if (_contactKeyForm.currentState!.validate()) {
                  setState(() {
                    context.read<ShowContactsProvider>().writeNewContact(
                        contactNameController.text,
                        contactPhoneController.text,
                        contactAddressController.text);
                  });
                  Navigator.pop(context, true);
                }
              },
              child: const Icon(Icons.check),
            ),
          );
        }));
  }
}
