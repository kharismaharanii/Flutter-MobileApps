import 'package:flutter/material.dart';
import 'package:mybengkel/admin/datakatalog.dart';
import 'package:mybengkel/admin/dataservice.dart';
import 'package:mybengkel/homepage/homepage.dart';

class HomeAdmin extends StatelessWidget {
  HomeAdmin({required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 200),
            child: Container(
              child: Image.asset(
                'assets/images/img12.png',
                height: 180,
                width: 180,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Homepage();
                            }));
                          },
                          icon: Icon(
                            Icons.exit_to_app,
                            size: 35,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Selamat Datang di',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontFamily: 'PTSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'MyBengkel',
                    style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 35,
                        color: Colors.lightBlue[900],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 180,
                  ),
                  Wrap(
                    children: <Widget>[
                      SessionCard(
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return dataService();
                          }));
                        },
                        namaapparel: "Data Service",
                        img: "assets/icons/png/serviceadmin.png",
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      SessionCard(
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return dataKatalog();
                            }));
                          },
                          namaapparel: "Data Katalog",
                          img: "assets/icons/png/katalogadmin.png"),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final press;
  final String namaapparel;
  final String img;
  const SessionCard({
    Key? key,
    this.press,
    required this.img,
    required this.namaapparel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.grey),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 42,
                  width: 42,
                  child: Image.asset(img),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  namaapparel,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: ('PTSans'),
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
