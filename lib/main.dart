import 'package:flutter_app/services/auth.dart';
import 'lib.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'login_screen.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
//import 'dart:convert';
import 'Product.dart';
import 'FirebaseData.dart';
String userUid = "no user";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}
/*
class SearchBarDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
        //home: new SearchBarDemoHome()

          home: MyHomePage(title: 'Product layout demo home page'),

    );
    //  home: MyHomePage(title: 'Product layout demo home page'),
    //),
  }
}*/
/*class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.description, this.price, this.image);
  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product("C++", "book for learning basic C++ programing language", 00, "c++.png"));
    items.add(Product("PYTHON", "book for learning basic python programing language",00, "python.png"));
    items.add(Product("CODERS AT WORK", "book for learning basic C++ programing language", 00, "coders at work.png"));
    items.add(Product("JAVA", "book for learning basic java programing language", 00, "java.png"));
    items.add(Product("LET US C", "book for learning basic C programing language", 00, "LetUsC.png"));
    items.add(Product("JAVA 8", "book for learning basic to advance java 8 programing language", 00, "java 8.png"));
    return items;
  }
}
}*/
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

class DrawerExample extends StatelessWidget {
  DrawerExample({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          elevation: 10,
          backgroundColor: Colors.deepOrange,
          actions: [
            /*Padding(
            padding: EdgeInsets.all(8.0),

            child: Icon(Icons.search,),

          ),*/
            /*
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          */

            /*  Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),*/
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
                accountName: Text("deepak"),
                accountEmail: Text("test@gmail.com"),
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
                  Navigator.push(
                      context, new MaterialPageRoute(builder: (context) => new Profile()));
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
                          builder: (context) => new Help_Feedback()));
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
        /*body: Center(
        child: ElevatedButton(
          child: Text(''),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),*/
      ),
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
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))),
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
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))),
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
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))),
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

/*class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;
  MyHomePage({Key key, this.title, this.products}) : super(key: key);
  // final items = Product.getProducts();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if(snapshot.hasData) {
                List<DocumentSnapshot> documents = snapshot.data.documents;
                List<Product> items = List<Product>();
                for(var i = 0; i < documents.length; i++) {
                  DocumentSnapshot document = documents[i];
                  items.add(Product.fromMap(document.data));
                }
                return ProductBoxList(items: items);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

}
class ProductPage extends StatelessWidget {
  ProductPage({Key key, this.item}) : super(key: key);
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight:
                                FontWeight.bold)),
                            Text(this.item.description),
                            Text("Price: " +
                                this.item.price.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

 */
/*class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))),
        title: Text("all books"),
        centerTitle: true,
      ),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
              name: "C++",
              description: "book for learning basic C++ programing language",
              price: 1000,
              image: "c++.png"),
          ProductBox(
              name: "java",
              description: "book for learning basic java programing language",
              price: 800,
              image: "java.png"),
          ProductBox(
              name: "java 8",
              description:
                  "book for learning basic to advance java 8 programing language",
              price: 2000,
              image: "java 8.png"),
          ProductBox(
              name: "let us c",
              description: "book for learning basic c programing language",
              price: 1500,
              image: "LetUsC.png"),
          ProductBox(
              name: "python",
              description: "book for learning basic python programing language",
              price: 100,
              image: "python.png"),
          ProductBox(
              name: "coding",
              description: book for learning basic C++ programing language,
              price: 20,
              image: "coders at work.png"),
        ],
      ),
    );
  }
}
*/


/*
class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.item}) : super(key: key);
  final Product item;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight:
                                FontWeight.bold)),
                            Text(this.item.description),
                            Text("Price: " + this.item.price.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
*/
/*class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          Text(this.description),
                          Text("Price: ₹ " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
*/