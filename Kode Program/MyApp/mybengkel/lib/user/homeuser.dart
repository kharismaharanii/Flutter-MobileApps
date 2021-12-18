import 'package:flutter/material.dart';
import 'package:mybengkel/homepage/widgets/bottom_nav.dart';
import 'package:mybengkel/homepage/widgets/katalog.dart';
import 'package:mybengkel/user/aksesoris.dart';
import 'package:mybengkel/user/apparel.dart';
import 'package:mybengkel/user/createService.dart';
import 'package:mybengkel/user/oli.dart';
import 'package:mybengkel/user/sparepart.dart';
import 'package:mybengkel/user/viewInfo.dart';

class HomeUser extends StatelessWidget {
  HomeUser({required this.username});

  final String username;

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
                  icons: "assets/icons/png/homeon.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeUser(username: username);
                    }));
                  },
                  isActive: true,
                ),
                BottomNav(
                  title: "Service",
                  icons: "assets/icons/png/serviceoff.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return createService();
                    }));
                  },
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 73, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Selamat Datang di',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: ('PTSans'),
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('MyBengkel',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: ('PTSans'),
                            fontSize: 35,
                            color: Colors.lightBlue[900])),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 200, 20, 5),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: .85,
              children: <Widget>[
                Katalog(
                  gambar: 'assets/icons/png/gears.png',
                  judul: 'Sparepart',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Sparepart();
                    }));
                  },
                ),
                Katalog(
                  gambar: 'assets/icons/png/tshirt.png',
                  judul: 'Apparel',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Apparel();
                    }));
                  },
                ),
                Katalog(
                  gambar: 'assets/icons/png/oli.png',
                  judul: 'Oli',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Oli();
                    }));
                  },
                ),
                Katalog(
                  gambar: 'assets/icons/png/ban.png',
                  judul: 'Aksesoris',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Aksesoris();
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
