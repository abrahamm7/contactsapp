import 'package:contactsapp/feature/contacts/presentation/pages/edit_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/show_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/write_contacts_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as dependencies;

void main() async {
  await dependencies.init();
  runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.green),
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const ShowContacts(),
        '/newContact': (context) => const CreateContact(),
        '/editContact': (context) => const EditContact()
      }));
}
