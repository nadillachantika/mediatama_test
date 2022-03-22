import 'dart:convert';
import 'package:http/http.dart'as http;

import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({ Key? key }) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
   bool loading = false;

  List? barang;

  Future<void> addDataChart() async {
    setState(() {
      loading = true;
    });

    http.Response res = await http
        .get(Uri.parse('http://192.168.100.62/server_barang/data_chart.php'));
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);

    if (data['is_success'] == true) {
      barang = data['data'];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    addDataChart();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: (){
                addDataChart();

          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: barang?.length ?? 0,
              itemBuilder: (context, index) {
                var item = barang?[index];

                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UpdatePage(
                    //               item: item,
                    //             )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: Colors.blue.withOpacity(0.2))),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item['nama_barang']}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Jumlah : ${item['jumlah']}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            "Rp ${item['harga']}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
     
    );
  }
}