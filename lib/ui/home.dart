import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_chat/ui/allcontacts.dart';
import 'package:my_chat/ui/cameras.dart';
import 'package:my_chat/ui/chats.dart';
import 'package:my_chat/ui/contacts.dart';
import 'package:my_chat/util/kons.dart';

class Home extends StatefulWidget {
  var cameras;

  Home(this.cameras);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  TabController _tabController;
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text(Kons.name);
  bool _IsSearching;
  String _searchText = "";

  _HomeState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "empty";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(Kons.name);
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _IsSearching = false;

    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: appBarTitle,
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(text: "CONTACTS"),
          ],
        ),
        actions: <Widget>[
          new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                      controller: _searchQuery,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                    );

                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              }),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Tanamo Inc"),
              accountEmail: Text("tanamoinc@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "T",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Welcome Home !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color(0xffe74c3c),
                    textColor: Color(0xffffffff));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "How can i help you ?",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color(0xffe74c3c),
                    textColor: Color(0xffffffff));
              },
            ),
            ListTile(
              leading: Icon(Icons.thumb_up),
              title: Text("Rate US"),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Please find time to rate us.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color(0xffe74c3c),
                    textColor: Color(0xffffffff));
              },
            ),
            ListTile(
              leading: Icon(Icons.archive),
              title: Text("Downloads"),
              subtitle: Text("Get Offline Data"),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "All downloads pending...",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color(0xffe74c3c),
                    textColor: Color(0xffffffff));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Settings mode activated",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Color(0xffe74c3c),
                    textColor: Color(0xffffffff));
              },
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new Chats(),
          new Contacts(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute<Null>(
              builder: (BuildContext context) => AnotherScreen()));
        },
        tooltip: 'Click Me',
        elevation: 6.0,
      ),
    );
  }
}
