import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_session/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      Widget nextPage = LoginPage();
      bool? check = prefs.getBool(LoginPage.LOGINKEY);
      print(check);
      if (check != null) {
        if (check) {
          nextPage = HomePage();
        }
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => nextPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Transform.scale(scale: 5.5, child: FlutterLogo()),
            SizedBox(
              height: 80,
            ),
            Text("This is Flutter Splash Screen")
          ],
        ),
      ),
    );
  }
}
