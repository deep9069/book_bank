import 'package:flutter_app/CardCarousel.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'download.dart';
import 'router.dart' as router;
import 'package:flutter_app/services/auth.dart';
//import 'lib.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'login_screen.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'Product.dart';
import 'productDetails.dart';
import 'load_pdf.dart';
import 'homeSlider.dart';
import 'mobile_pdf.dart';
import 'screen_args.dart';
import 'PDF_opner.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}*/
String userUid = "no user";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  runApp(MyAppSplashScreen());
}

class MyAppSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyappD(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyappD extends DrawerExample {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orange,
        // ignore: deprecated_member_use
        cursorColor: Colors.black,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subtitle1: TextStyle(fontFamily: 'NatoSans'),
          bodyText2: TextStyle(fontFamily: 'NatoSans'),
        ),
      ),
      home: LoginScreen(),
        debugShowCheckedModeBanner: false
    );
  }
}
class callrouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
/*
String userUid = "no user";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

//void main() => runApp(MyApp());
class Myapp extends DrawerExample {
  @override
  /*DrawerExample createState() => DrawerExample();
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new DrawerExample());
*/
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orange,
        // ignore: deprecated_member_use
        cursorColor: Colors.black,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subtitle1: TextStyle(fontFamily: 'NatoSans'),
          bodyText2: TextStyle(fontFamily: 'NatoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
*/
class DrawerExample extends StatelessWidget {
  DrawerExample({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(fontSize: 18, color: Colors.black),),
          elevation: 10,
          backgroundColor: Colors.deepOrange,
          actions: [
            Padding(
            padding: EdgeInsets.all(8.0),

            child: Icon(Icons.search,),

          ),

          /*Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),*/


         Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
            // ignore: deprecated_member_use
          ],
        ),

        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: new ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Deepak Kumar"),
                accountEmail: Text("deep7982129926@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/python.png"),
                ),
              ),
              new ListTile(
                title: new Text('HOME'),
                leading: Icon(Icons.home),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new DrawerExample()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.search),
                title: new Text("SEARCH"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SearchAppBar()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.book),
                title: Text('BOOKS'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                 // var screenArgs;
                  Navigator.push(
                      context, new MaterialPageRoute(builder: (context) => new DW()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('PROFILE'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Profile()));
                  // Then close the drawer
                  // Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: Icon(Icons.settings),
                title: Text('SETTINGS'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Setting()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.help),
                title: Text('HELP & FEEDBACK'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new contact_us()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.support),
                title: Text('CONTACT US'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new contact_us()));
                },
              ),
            ],
          ),
        ),
        body: MyAppCard()
        // body: Center(
        // child: ElevatedButton(
        //   child: Text(''),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => SecondPage()),
        //     );
        //   },
        // ),
      //),
      ),
        debugShowCheckedModeBanner: false
    );

  }
}

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = new Text(
    "Search Sample",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _sSearching;
  String _searchText = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _sSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _sSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _sSearching = false;
    init();
  }

  void init() {
    // ignore: deprecated_member_use
    _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        key: key,
        appBar: buildBar(context),
        body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _sSearching ? _buildSearchList() : _buildList(),
        ),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact)).toList();
    } else {
      // ignore: deprecated_member_use
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _searchQuery,
                style: new TextStyle(
                  color: Colors.deepOrangeAccent,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _sSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.actionIcon = new Icon(
        Icons.arrow_back,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.deepOrangeAccent),
      );
      _sSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }
}

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DrawerExample()))),
          centerTitle: true,
          title: appBarTitle,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                    );
                  } else {
                    this.actionIcon = new Icon(Icons.search);
                    this.appBarTitle = new Text("AppBar Title");
                  }
                });
              },
            ),
          ]),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text('SORRY THIS IS UNDER DEVELOPMENT', style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
            fontSize: 25)),
      ),
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            /*onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))*/),
        title: Text("profile"),
        centerTitle: true,
      ),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text('SORRY THIS IS UNDER DEVELOPMENT', style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
            fontSize: 25)),
      ),
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
           /* onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAppPDF()))*/),
        title: Text("settings"),
        centerTitle: true,
      ),
    );
  }
}

class Help_Feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text('please let us know where are we behind. Please mention if any changes required and what should change or features should be added. Please feel free to write us and email us at deep7982129926@gmail.com\n\nWe will listen to you and try our best to provide the best service possible.',
            style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      appBar: new AppBar(
        /*leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAppCard()))),*/
        title: Text("help & feedback"),
        centerTitle: true,
      ),
    );
  }
}

class contact_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
        child: Text('THIS IS UNDER DEVELOPMENT', style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
            fontSize: 25)),
        ),
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
             onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => DrawerExample()))),
         title: Text("contact us"),

      centerTitle: true,
    ));
  }
}

