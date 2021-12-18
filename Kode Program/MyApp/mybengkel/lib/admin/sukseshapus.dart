import 'package:flutter/material.dart';
import 'package:mybengkel/admin/homeadmin.dart';

import '../main.dart';

class sukseshapus extends StatelessWidget {
  const sukseshapus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 120),
            child: Text(
              "Status Hapus",
              style: TextStyle(
                  fontFamily: ('PTSans'),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 25),
            child:
                Image.asset("assets/images/img15.png", height: 350, width: 350),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 680, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
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
                        EdgeInsets.all(13)),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.blueGrey;
                    }),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeAdmin(username: username);
                    }));
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
