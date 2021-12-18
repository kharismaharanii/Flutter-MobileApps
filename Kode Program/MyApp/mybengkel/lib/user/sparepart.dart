import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mybengkel/user/detailKatalog.dart';

class Sparepart extends StatefulWidget {
  @override
  SparepartState createState() => SparepartState();
}

class SparepartState extends State<Sparepart> {
  final String url =
      'http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/user/viewSparepart.php';
  List data = [];
  Future<String> getData() async {
    var res =
        await http.get(Uri.parse(url), headers: {'accept': 'application/json'});

    setState(() {
      var content = json.decode(res.body);
      data = content;
    });
    return "";
  }

  @override
  void initState() {
    this.getData();
  }

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
            padding: const EdgeInsets.only(top: 120, left: 90),
            child: Container(
              child: Image.asset(
                'assets/images/img9.png',
                height: 225,
                width: 225,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Sparepart',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontFamily: 'PTSans',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[900],
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 310, left: 10),
            child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListTile(
                    title: Text(
                      data[index]['namabarang'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: ('PTSans')),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            detailKatalog(data: data, index: index))),
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Tipe: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['tipe'] == null
                                  ? ''
                                  : data[index]['tipe'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Harga: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['harga'] == null
                                  ? ''
                                  : data[index]['harga'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/icons/png/plus.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
