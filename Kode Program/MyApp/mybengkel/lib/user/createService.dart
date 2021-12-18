import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybengkel/homepage/widgets/bottom_nav.dart';
import 'package:mybengkel/main.dart';
import 'package:mybengkel/user/homeuser.dart';
import 'package:mybengkel/user/sukses.dart';
import 'package:mybengkel/user/viewInfo.dart';

class createService extends StatefulWidget {
  @override
  _createServiceState createState() => _createServiceState();
}

class _createServiceState extends State<createService> {
  TextEditingController nama = TextEditingController();
  TextEditingController haritanggal = TextEditingController();
  TextEditingController tipesepeda = TextEditingController();

  createService() {
    var url =
        "http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/user/createService.php";
    http.post(Uri.parse(url), body: {
      "nama": nama.text,
      "haritanggal": haritanggal.text,
      "tipesepeda": tipesepeda.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BottomNav(
                  title: "Ketentuan",
                  icons: "assets/icons/png/infooff.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Info();
                    }));
                  },
                ),
                BottomNav(
                  title: "Home",
                  icons: "assets/icons/png/homeoff.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeUser(username: username);
                    }));
                  },
                ),
                BottomNav(
                  title: "Service",
                  icons: "assets/icons/png/serviceon.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return createService();
                    }));
                  },
                  isActive: true,
                ),
              ],
            ),
          ),
        ),
      ),
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
            padding: const EdgeInsets.only(top: 50, left: 70),
            child: Text(
              "Form Pesan Service",
              style: TextStyle(
                  fontFamily: ('PTSans'),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: nama,
                      decoration: InputDecoration(labelText: "Nama"),
                    ),
                    TextField(
                      controller: haritanggal,
                      decoration: InputDecoration(
                        labelText: "Hari Kedatangan",
                        hintText: "Misal : 31/02/2021",
                        hintStyle:
                            TextStyle(fontSize: 13, fontFamily: "PTSans"),
                      ),
                    ),
                    TextField(
                      controller: tipesepeda,
                      decoration: InputDecoration(labelText: "Tipe Sepeda"),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 330, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ElevatedButton(
                            child: Text(
                              'Pesan Service',
                              style: TextStyle(
                                  fontFamily: ('PTSans'), fontSize: 20),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.blue, width: 2),
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
                              createService();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return sukses();
                              }));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
