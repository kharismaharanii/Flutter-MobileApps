import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mybengkel/admin/detailservice.dart';

class dataService extends StatefulWidget {
  @override
  dataServiceState createState() => dataServiceState();
}

class dataServiceState extends State<dataService> {
  final String url =
      'http://10.0.2.2:8080/myapp/mybengkel/lib/koneksi/admin/viewdataService.php';
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
            padding: const EdgeInsets.only(top: 110, left: 80),
            child: Container(
              child: Image.asset(
                'assets/images/img13.png',
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
                        'Data Service',
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
                              'Hari Datang: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['haritanggal'] == null
                                  ? ''
                                  : data[index]['haritanggal'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Tipe Motor: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['tipesepeda'] == null
                                  ? ''
                                  : data[index]['tipesepeda'],
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
                                detailservice(data: data, index: index)));
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
