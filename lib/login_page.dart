import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_session/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final LOGINKEY = "isLoggedIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    label: Text(
                      "username",
                      style: TextStyle(fontSize: 18),
                    ),
                    prefixIcon: Icon(Icons.account_box),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    label: Text(
                      "Passwd",
                      style: TextStyle(fontSize: 18),
                    ),
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    padding: EdgeInsets.symmetric(horizontal: 50)),
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(LOGINKEY, true); // Set login flag to true
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(), // Navigate to HomePage instead of LoginPage
                      ));
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 28),
                ),
              )
            ],
          ),
        ));
  }
}
