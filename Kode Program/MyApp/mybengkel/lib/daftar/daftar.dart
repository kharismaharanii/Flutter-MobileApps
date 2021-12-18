import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybengkel/daftar/suksesdaftar.dart';

class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Daftar() {
    var url = "http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/daftar.php";
    http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
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
          ),
          Container(
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  "DAFTAR",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.lightBlue[900],
                      fontFamily: 'PTSans',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/img5.png',
                  height: 225,
                ),
                TextField(
                  controller: username,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: ('PTSans')),
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: ('PTSans')),
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: Text(
                    'Daftar',
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
                    Daftar();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return suksesdaftar();
                    }));
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
                    Navigator.pop(context);
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
