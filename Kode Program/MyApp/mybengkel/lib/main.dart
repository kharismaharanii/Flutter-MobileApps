import 'package:flutter/material.dart';
import 'package:mybengkel/admin/homeadmin.dart';
import 'package:mybengkel/homepage/homepage.dart';
import 'package:mybengkel/user/homeuser.dart';

void main() {
  runApp(MyApp());
}

String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: <String, WidgetBuilder>{
        '/HomeAdmin': (BuildContext context) => new HomeAdmin(
              username: username,
            ),
        '/HomeUser': (BuildContext context) => new HomeUser(
              username: username,
            ),
        '/HomePage': (BuildContext context) => new Homepage(),
      },
    );
  }
}
