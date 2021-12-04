// ignore_for_file: unnecessary_new

import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/data/repositories/contact_repository_impl.dart';
import 'package:contactsapp/feature/contacts/presentation/components/contactscard.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/write_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/providers/show_contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ShowContacts extends StatefulWidget {
  const ShowContacts({Key? key}) : super(key: key);

  @override
  _ShowContactsState createState() => _ShowContactsState();
}

class _ShowContactsState extends State<ShowContacts> {
  ContactInfoLocalDataSourceImpl contactRepositoryImpl =
      ContactInfoLocalDataSourceImpl();
  List<ContactInfoModel> listContacts = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  void getContacts() async {
    listContacts = await contactRepositoryImpl.getContacts();
    print(listContacts.length);
    setState(() {});
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
            body: listContacts.isEmpty
                ? ListView(
                    children: <Widget>[
                      Lottie.asset('assets/lottieJSON/empty-state.json',
                          height: 300, width: 400),
                      const Center(
                          heightFactor: 15,
                          child: Text('Aún no hay contactos',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'Roboto')))
                    ],
                  )
                : ListView(
                    children: <Widget>[
                      for (var item in listContacts)
                        ContactsCard(
                            id: item.id,
                            nameContact: item.name,
                            phoneContact: item.phoneNumber,
                            addressContact: item.address)
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(
                          builder: (_) => const CreateContact()))
                      .then((value) => value ? getContacts() : null);
                });
              },
              child: const AvatarGlow(child: Icon(Icons.add), endRadius: 60.0),
            ),
          );
        }));
  }
}
