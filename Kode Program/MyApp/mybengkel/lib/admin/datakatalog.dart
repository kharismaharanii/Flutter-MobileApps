import 'package:flutter/material.dart';
import 'package:mybengkel/admin/detailkatalog.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class dataKatalog extends StatefulWidget {
  @override
  dataKatalogState createState() => dataKatalogState();
}

class dataKatalogState extends State<dataKatalog> {
  final String url =
      'http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/admin/viewDataKatalog.php';
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
            padding: const EdgeInsets.only(top: 110, left: 90),
            child: Container(
              child: Image.asset(
                'assets/images/img7.png',
                height: 225,
                width: 225,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Data Katalog',
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 310, left: 10),
            child: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListTile(
                    title: Text(
                      data[index]['nama'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: ('PTSans')),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Alamat : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['alamat'] == null
                                  ? ''
                                  : data[index]['alamat'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Nama Barang : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['namabarang'] == null
                                  ? ''
                                  : data[index]['namabarang'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Harga : ',
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
                        Row(
                          children: <Widget>[
                            Text(
                              'Jumlah : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['jumlah'] == null
                                  ? ''
                                  : data[index]['jumlah'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return Colors
                                .black; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                detailkatalog(data: data, index: index)));
                      },
                      child: Text('Detail'),
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
