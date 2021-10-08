import 'dart:isolate';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'main.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

//this is a test widget
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  runApp(DW());
}

class DW extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Test( ),
    );
  }
}


class Test extends StatelessWidget {
  final String title;
  final Stream<QuerySnapshot> products;
  Test({Key key, this.title, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawerExample()))),
            title: Text("Books Available")),
        body: Center(
             child:StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('product').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                //checking if database is empty or not
                if (snapshot.data == null || snapshot.data.docs.toList().length == 0) {
                  print("no data");
                  return Center(
                    //if database is empty then showing empty alart on the screen
                    child: Text("it's Empty no data found on firebase ", style: TextStyle(fontSize: 40),
                    ),
                  );
                } else {
                  return new ListView(children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return new CustomCard(
                  name: document.data()['name'],
                  description: document.data()['description'],
                  price: document.data()['price'].toString(),
                  image: document.data()['image'],
                  link: document.data()['link'],
                  imglink: document.data()['imglink'],
                  );
                  }).toList(),
                  );
                  }
                 }


            )
        )
            );
      }
    }

  class CustomCard extends StatelessWidget {
  CustomCard({@required this.name, this.description, this.price, this.image,this.link, this.imglink});

  final name;
  final description;
  final price;
  final image;
  final link;
  final imglink;

  @override
  Widget build(BuildContext context) {
  return Card(
  child: Container(
  padding: const EdgeInsets.only(top: 5.0),
  child: Row(
      //spacing: 5.0,
      //runSpacing: 5.0,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
  // = new Uri.http('dog.ceo', '/api/breeds/image/random');

    Image.network(imglink,width: 200,
      fit: BoxFit.fill,),

        Expanded(

          child: Container(

            padding: EdgeInsets.all(5),
             child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Text(this.name,
                  style: TextStyle(fontWeight:
                    FontWeight.bold)),
                     // Text(this.description),
                     //Text("Price: " + this.price.toString()),

                //Text(name),
                // ignore: deprecated_member_use
              FlatButton(
                child: Text('DETAILS'),
                   color: Theme.of(context).primaryColor,
                 textColor: Colors.white,
                  onPressed: () {
                  Navigator.push(
                 context,
                  MaterialPageRoute(
                 builder: (context) => SecondPage(name: name, description: description, price: price, image: image, link: link, imglink: imglink)));
  }),
  ],
    )))
  ],)));
  }
  }

  class SecondPage extends StatelessWidget {
  SecondPage({@required this.name, this.description, this.price, this.image, this.link, this.imglink});

  final name;
  final description;
  final price;
  final image;
  final link;
  final imglink;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text(name),
  ),
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Image.network(imglink,width: 200, fit: BoxFit.fill,),
    Expanded(
        child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(this.name,
                    style: TextStyle(fontWeight:
                    FontWeight.bold)),
                Text(this.description),
                Text("Price: " + this.price.toString()),
              ],
            ))),
  // Text(name),
  // Text(description),
  // Text(price),
  // // ignore: deprecated_member_use
   // ignore: deprecated_member_use
   FlatButton(
   child: Text('Save in PHONE'),
   color: Theme.of(context).primaryColor,
   textColor: Colors.white,
   onPressed: () {
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) =>
                 ThirdPage(name: name,
                     //description: description,
                     //price: price,
                     //image: image,
                     link: link,
                     //imglink: imglink
                 )));

     /*onPressed: ()async{
     final externalDir = await getExternalStorageDirectory();
     final status = await Permission.storage.request();
     if(status.isGranted) {
      final id =  FlutterDownloader.enqueue(url: link,
       savedDir: externalDir.path,
       fileName: name,
       showNotification: true,
       openFileFromNotification: true);
     }else{print("permission denied");
     }},*/
   }),
    // ignore: deprecated_member_use
    FlatButton(
    child: Text('OPEN'),
    color: Theme.of(context).primaryColor,
    textColor: Colors.white,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) =>
      MyAppPDF(name: name,
          //description: description,
          //price: price,
          //image: image,
          link: link,)));
    })

  ]),
  ));
  }
  }



class ThirdPage extends StatefulWidget {

  //ThirdPage({Key key, this.name, this.link}) : super(key: key);
  ThirdPage({@required this.name, this.link});

  final name;
  //final description;
  //final price;
  //final image;
  final link;
  //final imglink;
 // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(name:name,link:link);
}

class _MyHomePageState extends State<ThirdPage> {
  _MyHomePageState({@required this.name, this.description, this.price, this.image,this.link, this.imglink});

  final name;
  final description;
  final price;
  final image;
  final link;
  final imglink;
  int progress = 0;


  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort.send([id, status, progress]);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");


    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print(progress);
    });


    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("$progress", style: TextStyle(fontSize: 40),),

            SizedBox(height: 60,),

            // ignore: deprecated_member_use
            FlatButton(
              child: Text("DOWNLOAD"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () async {
                final status = await Permission.storage.request();

                if (status.isGranted) {
                  final externalDir = await getExternalStorageDirectory();

                  final id = await FlutterDownloader.enqueue(url: link,
                    savedDir: externalDir.path,
                    fileName: name + ".pdf",
                    showNotification: true,
                    openFileFromNotification: true,
                  );


                } else {
                  print("Permission deined");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}


///for loading pdf in app

class MyAppPDF extends StatefulWidget {
  MyAppPDF({@required this.name, this.link});

  final name;
  final link;
  @override
  _MyAppState createState() => _MyAppState(name:name,link:link);
}

class _MyAppState extends State<MyAppPDF> {
  _MyAppState({@required this.name, this.link});

  final name;
  final link;
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    PdftronFlutter.openDocument(link);
  }

  // Platform messages are asynchronous, so we initialize via an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //PdftronFlutter.initialize('free');
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDFTron Document Opener'),
        ),
        body: Center(
          child: Text(
              'PDFtron ' ,
              //'Running on: $_version\n'
          ),
        ),
      ),
    );
  }
}
