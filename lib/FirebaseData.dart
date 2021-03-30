/*mport 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() => runApp(MyApp(products: fetchProducts()));
/*List<Product> fetchProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}*/
 Stream<QuerySnapshot> fetchProducts() {
  return Firestore.instance.collection('product').snapshots();
}

class MyApp extends StatelessWidget {
  final Stream<QuerySnapshot> products;
  MyApp({Key key, this.products}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Product Navigation demo home page', products:
      products),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  final Stream<QuerySnapshot> products;
  MyHomePage({Key key, this.title, this.products}) : super(key: key);
  // final items = Product.getProducts();
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
class ProductBoxList extends StatelessWidget {
  final List<Product> items;
  ProductBoxList({Key key, this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductBox(item: items[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(item: items[index]),
              ),
            );
          },
        );
      },
    );
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
    Text("Price: " + this.item.price.toString()),
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
                Image.asset("assets/appimages/" + this.item.image),
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
}*/