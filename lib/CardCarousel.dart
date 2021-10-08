import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/productDetails.dart';


class MyAppCard extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppCard> {
  int _currentIndex=0;

  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Carousel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          // appBar: AppBar(
          //     title:Text("Flutter Card Carousel")
          // ),
          body: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 3.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card){
                  return Builder(
                      builder:(BuildContext context){
                        return Container(
                          height: MediaQuery.of(context).size.height*0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.blueAccent,
                            child: card,
                          ),
                        );
                      }
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 6.0,
                    height: 6.0,
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.pinkAccent : Colors.blueGrey,
                    ),
                  );
                }),
              ),
            ],
          )
      ),
        debugShowCheckedModeBanner: false
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Color(0xffff4000),Color(0xffffcc66),]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.network('https://firebasestorage.googleapis.com/v0/b/book-5fb39-dc925.appspot.com/o/flutter.png?alt=media&token=f69a23cb-4cca-4afe-89ab-d956182dee1b.png',
                width: MediaQuery.of(context).size.width,
                height: 190.0,
                fit: BoxFit.fill,
                // fit: BoxFit.cover,
              )
            ],
          ),
        ),
    onTap: () {print("tapped on container");
          ///DW();
    },
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.network('https://firebasestorage.googleapis.com/v0/b/book-5fb39-dc925.appspot.com/o/TeachJava.png?alt=media&token=a77abc34-5ee3-4db1-a55d-4dbc009259e0.png',
            width: MediaQuery.of(context).size.width,
            height: 190.0,
            fit: BoxFit.fill,
            // fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network('https://firebasestorage.googleapis.com/v0/b/book-5fb39-dc925.appspot.com/o/SamsC%2B%2B.png?alt=media&token=d886031c-0264-4663-8636-48b9631d2777.png',
            width: MediaQuery.of(context).size.width,
            height: 190.0,
            fit: BoxFit.fill,
           // fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          Image.network('https://firebasestorage.googleapis.com/v0/b/book-5fb39-dc925.appspot.com/o/LearningPython.png?alt=media&token=ea7fa8ae-77d1-4506-b367-26bff140036f.png',
            width: MediaQuery.of(context).size.width,
            height: 190.0,
            fit: BoxFit.fill,
            // fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}