import 'package:contactsapp/utils/getinitials.dart';
import 'package:flutter/material.dart';

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
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text(NameHelpers.getInitials(widget.nameContact)),
                  ),
                  const SizedBox(width: 10),
                  Center(
                    child: Text(widget.nameContact),
                  ),
                  const SizedBox(width: 10),
                  Center(
                    child: Text(widget.phoneContact),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
