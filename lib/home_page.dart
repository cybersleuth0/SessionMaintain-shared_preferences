import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_session/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Welcome To homepage",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(height: 30),
              Text(
                "HomePage",
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white54,
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setBool(LoginPage.LOGINKEY, false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    "LogOut",
                    style: TextStyle(fontSize: 28),
                  ))
            ],
          ),
        ));
  }
}
