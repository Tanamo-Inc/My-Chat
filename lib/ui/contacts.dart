import 'package:flutter/material.dart';
import 'package:my_chat/model/contacto.dart';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() {
    return new ContactsState();
  }
}

class ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: con_mod.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),

              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(con_mod[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      con_mod[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    con_mod[i].status,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )

            ],
          ),
    );
  }
}
