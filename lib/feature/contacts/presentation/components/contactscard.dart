import 'dart:math';
import 'package:contactsapp/feature/contacts/presentation/pages/edit_contacts_page.dart';
import 'package:contactsapp/utils/getinitials.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
                Dialogs.bottomMaterialDialog(
                    context: context,
                    msg: widget.phoneContact,
                    title: widget.nameContact,
                    actions: <Widget>[
                      IconsButton(
                        onPressed: () async {
                          FlutterPhoneDirectCaller.callNumber(
                              widget.phoneContact);
                        },
                        text: 'Call',
                        iconColor: Colors.green,
                        iconData: Icons.call,
                      ),
                      IconsButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EditContact(
                                    id: widget.id,
                                    nameContact: widget.nameContact,
                                    phoneContact: widget.phoneContact,
                                    addressContact: widget.addressContact)));
                          },
                          text: 'Edit',
                          iconColor: Colors.white,
                          iconData: Icons.edit),
                      IconsButton(
                        onPressed: () {},
                        text: 'Delete',
                        iconColor: Colors.red,
                        iconData: Icons.delete,
                      )
                    ],
                    color: Colors.grey.shade800);
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
