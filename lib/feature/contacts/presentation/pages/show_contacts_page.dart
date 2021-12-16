import 'package:contactsapp/feature/contacts/data/datasource/contact_info_local_datasource_impl.dart';
import 'package:contactsapp/feature/contacts/data/models/contact_info_model.dart';
import 'package:contactsapp/feature/contacts/presentation/components/contactscard.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/write_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/providers/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:contactsapp/injection_container.dart';

import 'edit_contacts_page.dart';

class ShowContacts extends StatefulWidget {
  const ShowContacts({Key? key}) : super(key: key);

  @override
  _ShowContactsState createState() => _ShowContactsState();
}

class _ShowContactsState extends State<ShowContacts> {
  ContactInfoLocalDataSourceImpl contactInfoLocalDataSourceImpl =
      ContactInfoLocalDataSourceImpl();
  List<ContactInfoModel> listContacts = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  void getContacts() async {
    listContacts = await contactInfoLocalDataSourceImpl.getContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactsProvider>(
        create: (context) => sl<ContactsProvider>(),
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
                        InkWell(
                          splashColor: Colors.green,
                          onTap: () {
                            Dialogs.bottomMaterialDialog(
                                context: context,
                                msg: item.phoneNumber,
                                title: item.name,
                                actions: <Widget>[
                                  IconsButton(
                                    onPressed: () async {
                                      FlutterPhoneDirectCaller.callNumber(
                                          item.phoneNumber);
                                    },
                                    text: 'Call',
                                    iconColor: Colors.green,
                                    iconData: Icons.call,
                                  ),
                                  IconsButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => EditContact(
                                                    id: item.id,
                                                    nameContact: item.name,
                                                    phoneContact:
                                                        item.phoneNumber,
                                                    addressContact:
                                                        item.address)));
                                      },
                                      text: 'Edit',
                                      iconColor: Colors.white,
                                      iconData: Icons.edit),
                                  IconsButton(
                                    onPressed: () {
                                      context
                                          .read<ContactsProvider>()
                                          .deleteContact(item.id as int);
                                      setState(() {
                                        getContacts();
                                      });
                                    },
                                    text: 'Delete',
                                    iconColor: Colors.red,
                                    iconData: Icons.delete,
                                  )
                                ],
                                color: Colors.grey.shade800);
                          },
                          child: ContactsCard(
                              id: item.id,
                              nameContact: item.name,
                              phoneContact: item.phoneNumber,
                              addressContact: item.address),
                        )
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
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
