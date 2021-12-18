import 'package:flutter/material.dart';

class Katalog extends StatelessWidget {
  final String gambar;
  final String judul;
  final press;
  const Katalog({
    Key? key,
    required this.gambar,
    required this.judul,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: -23,
            blurRadius: 17,
            offset: Offset(0, 17),
          )
        ],
      ),
      height: 20,
      width: 20,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Image.asset(
                  gambar,
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    judul,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'PTSans'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
