import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/homePage/homepage.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BOOK BANk',
      logo: 'assets/logo.png',
      onLogin: (data) {
        return Auth().signIn(data.name, data.password);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DrawerExample(),
        ));
      },
      onSignup: (data) {
        return Auth().signUp(data.name, data.password);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DrawerExample(),
        ));
      },
      onSubmitAnimationCompleted: () {
        print("check");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DrawerExample(),
        ));
      },
      onRecoverPassword: (data) {
        return Auth().sendOtp(data);
      },
      theme: LoginTheme(
        primaryColor: Colors.red.shade50,
        accentColor: Colors.grey.shade800,
        errorColor: Colors.red,
        titleStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          color: Colors.white,
          shadows: [Shadow(color: Colors.white, blurRadius: 0)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
        cardTheme: CardTheme(
          color: Colors.grey.shade700,
          elevation: 5,
          margin: EdgeInsets.only(top: 30),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(120.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.red.shade700,
            color: Colors.white,
          ),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 4),
            //borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 5),
            // borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            //borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            //borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            // borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.black,
          backgroundColor: Colors.teal.shade700,
          highlightColor: Colors.teal,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}
