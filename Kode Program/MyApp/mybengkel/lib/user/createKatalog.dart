import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybengkel/user/sukses.dart';

class createKatalog extends StatefulWidget {
  List data;
  int index;
  createKatalog({required this.data, required this.index});

  @override
  _createKatalogState createState() => _createKatalogState();
}

class _createKatalogState extends State<createKatalog> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerNamaBarang = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController();

  void createKatalog() {
    var url =
        "http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/user/createKatalog.php";
    http.post(Uri.parse(url), body: {
      "nama": controllerNama.text,
      "alamat": controllerAlamat.text,
      "namabarang": controllerNamaBarang.text,
      "harga": controllerHarga.text,
      "jumlah": controllerJumlah.text
    });
  }

  @override
  void initState() {
    controllerNama =
        TextEditingController(text: widget.data[widget.index]['nama']);
    controllerAlamat =
        TextEditingController(text: widget.data[widget.index]['alamat']);
    controllerNamaBarang =
        TextEditingController(text: widget.data[widget.index]['namabarang']);
    controllerHarga =
        TextEditingController(text: widget.data[widget.index]['harga']);
    controllerJumlah =
        TextEditingController(text: widget.data[widget.index]['jumlah']);
    super.initState();
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 10),
                    child: Text(
                      "Form Pesan Katalog",
                      style: TextStyle(
                          fontFamily: ('PTSans'),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[900]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: controllerNama,
                          decoration: InputDecoration(labelText: "Nama"),
                        ),
                        TextField(
                          controller: controllerAlamat,
                          decoration: InputDecoration(labelText: "Alamat"),
                        ),
                        TextField(
                          enabled: false,
                          controller: controllerNamaBarang,
                          decoration: InputDecoration(labelText: "Nama Barang"),
                        ),
                        TextField(
                          enabled: false,
                          controller: controllerHarga,
                          decoration: InputDecoration(labelText: "Harga"),
                        ),
                        TextField(
                          controller: controllerJumlah,
                          decoration: InputDecoration(
                            hintText: "Misal : 1",
                            labelText: "Jumlah",
                            hintStyle:
                                TextStyle(fontSize: 13, fontFamily: "PTSans"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 300, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text(
                            'Pesan Katalog',
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
                                EdgeInsets.all(13)),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.blueGrey;
                            }),
                          ),
                          onPressed: () {
                            createKatalog();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => sukses()));
                          },
                        ),
                      ],
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
