import 'dart:math';

import 'package:contactsapp/utils/getinitials.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';

class ContactsCard extends StatefulWidget {
  final int? id;
  final String nameContact;
  final String phoneContact;
  final String addressContact;

  const ContactsCard(
      {required this.id,
      required this.nameContact,
      required this.phoneContact,
      required this.addressContact,
      Key? key})
      : super(key: key);

  @override
  _ContactsCardState createState() => _ContactsCardState();
}

class _ContactsCardState extends State<ContactsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          child: Card(
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {
                setState(() {});
              },
              onLongPress: () {
                Dialogs.bottomMaterialDialog(
                    context: context,
                    msg: '¿Eliminar contacto?',
                    color: Colors.grey.shade800);
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          child: Text(
                            NameHelpers.getInitials(widget.nameContact),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Center(
                          child: Text(widget.nameContact),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
