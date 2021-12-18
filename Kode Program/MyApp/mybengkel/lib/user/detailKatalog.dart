import 'package:flutter/material.dart';
import 'package:mybengkel/user/createKatalog.dart';

class detailKatalog extends StatefulWidget {
  int index;
  List data = [];
  detailKatalog({required this.index, required this.data});
  @override
  _detailKatalogState createState() => _detailKatalogState();
}

class _detailKatalogState extends State<detailKatalog> {
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
            padding: const EdgeInsets.only(top: 30, left: 150),
            child: Container(
              child: Text(
                'Detail',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontFamily: 'PTSans',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[900],
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 80),
            child: Container(
              child: Image.asset(
                'assets/images/img17.png',
                height: 225,
                width: 225,
              ),
            ),
          ),
          // Center(
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.data[widget.index]['namabarang'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.data[widget.index]['tipe'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "Harga : " + widget.data[widget.index]['harga'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 320, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text(
                            "Pesan",
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
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    createKatalog(
                                  data: widget.data,
                                  index: widget.index,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
