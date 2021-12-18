import 'dart:convert';
import 'package:mybengkel/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future<List?> _login() async {
    var url = "http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/login.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        print("gagal");
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/HomeAdmin');
      } else if (datauser[0]['level'] == 'user') {
        Navigator.pushReplacementNamed(context, '/HomeUser');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.white,
                ],
                stops: [0.1, 0.9],
              ),
            ),
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.lightBlue[900],
                      fontFamily: 'PTSans',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/img6.png',
                  height: 250,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      filled: false,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Username",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w200),
                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: false,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w200),
                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(fontFamily: ('PTSans'), fontSize: 20),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(13),
                    ),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.blueGrey;
                    }),
                  ),
                  onPressed: () {
                    _login();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: Text(
                    'Kembali',
                    style: TextStyle(fontFamily: ('PTSans'), fontSize: 20),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(13),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
