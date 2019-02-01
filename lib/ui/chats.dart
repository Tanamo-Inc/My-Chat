import 'package:flutter/material.dart';
import 'package:my_chat/model/chato.dart';

class Chats extends StatefulWidget {
  @override
  ChatsState createState() {
    return new ChatsState();
  }
}

class ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: chat_mod.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(chat_mod[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      chat_mod[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      chat_mod[i].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    chat_mod[i].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
