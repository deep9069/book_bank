import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//this is a test widget
class Test extends StatelessWidget {
  Widget build(BuildContext context) {
    //using stream builder so that it can change the frame as soon as there is any change in database
    return StreamBuilder(
      //creating stream a instance of firestore
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //checking if database is empty or not
        if (snapshot.data == null || snapshot.data.docs.toList().length == 0) {
          print("no data");
          return Center(
            //if database is empty then showing empty aleart on the screen
            child: Text(
              "Empty",
              style: TextStyle(fontSize: 40),
            ),
          );
        } else {
          //using listview to show all books data listwise
          return ListView(
            //acsesing snaptop data i.e. databse data
            //as it is map then we are using map to acces that data
            children: snapshot.data.docs.map(
              //using map as instance of database map
              (document) {
                //displaying data
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: MediaQuery.of(context).size.width - 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //accesing database data by keys like name ,image
                        Text(
                          document['name'],
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          document['image'],
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          //as Text widget only display text
                          //price in data base is in int form so convert it to string we are using toString() method
                          document['price'].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          document['description'],
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              //converting maped items to list so that Listview widget can display them...
            ).toList(),
          );
        }
      },
    );
  }
}
