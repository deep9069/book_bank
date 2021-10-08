import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main(){
  runApp(MyApp2());
}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Image Slider"),),

      body: Container(

          constraints: BoxConstraints.expand(
              height: 200
          ),
          child: imageSlider(context)),
    );
  }
}


Swiper imageSlider(context){

  return new Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return new Image.network(
        "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
        fit: BoxFit.fitHeight,
      );

    },
    itemCount: 1,
    viewportFraction: 0.8,
    scale: 1.0,
  );

}