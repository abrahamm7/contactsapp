import 'package:contactsapp/feature/contacts/presentation/pages/edit_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/show_contacts_page.dart';
import 'package:contactsapp/feature/contacts/presentation/pages/write_contacts_page.dart';
import 'package:flutter/material.dart';

void main() {
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
