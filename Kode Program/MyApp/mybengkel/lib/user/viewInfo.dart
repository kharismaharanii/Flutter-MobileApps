import 'package:flutter/material.dart';
import 'package:mybengkel/homepage/homepage.dart';
import 'package:mybengkel/homepage/widgets/bottom_nav.dart';
import 'package:mybengkel/user/createService.dart';
import 'package:mybengkel/user/homeuser.dart';
import '../main.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                  icons: "assets/icons/png/infoon.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Info();
                    }));
                  },
                  isActive: true,
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
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
            child: Text(
              '1. Dapat memesan jenis katalog, seperti :',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 40),
            child: Text(
              'a. Sparepart',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190, left: 40),
            child: Text(
              'b. Apparel',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220, left: 40),
            child: Text(
              'c. Oli',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 40),
            child: Text(
              'd. Aksesoris',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280, left: 20, right: 20),
            child: Text(
              '2. Dapat memesan service',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 310, left: 20, right: 20),
            child: Text(
              '3. Pembayaran katalog secara COD',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 340, left: 40),
            child: Text(
              'Harap untuk membayar kepada kurir',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 370, left: 40),
            child: Text(
              'sebelum membuka barang',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 20, right: 20),
            child: Text(
              '4. Jika klik tombol "Pesan Katalog atau',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 430, left: 40),
            child: Text(
              'Pesan Service", maka :',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 460, left: 40),
            child: Text(
              'a. Telah menyetujui ketentuan',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 490, left: 40),
            child: Text(
              'b. Data yang anda kirim akan kami proses',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Center(
                    child: Text(
                      'Ketentuan',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontFamily: 'PTSans',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[900],
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 230,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 290),
                      child: ElevatedButton(
                        child: Text(
                          "Keluar",
                          style:
                              TextStyle(fontFamily: ('PTSans'), fontSize: 20),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(120, 13, 120, 13)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              return Colors.blue;
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Homepage()));
                        },
                      ),
                    ),
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
