import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  final item;
  const UpdatePage({Key? key, this.item}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  bool loading = false;

  Future<void> addData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));

    http.Response res = await http.post(
        Uri.parse("http://192.168.43.105/server_barang/add_barang.php"),
        body: {
          "nama_barang": namaController.text,
          "jumlah": jumlahController.text,
          "harga": hargaController.text,
        });
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);
    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    } else {
      print('Failed');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<void> updateData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));

    http.Response res = await http.post(
        Uri.parse("http://192.168.43.105/server_barang/update_barang.php"),
        body: {
          "id_barang": widget.item['id_barang'],
          "nama_barang": namaController.text,
          "jumlah": jumlahController.text,
          "harga": hargaController.text,
        });
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);
    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Success')));
    } else {
      print('Failed');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed')));
    }
  }

  Future<void> deleteData() async {
    http.Response res = await http.post(
        Uri.parse("http://192.168.43.105/server_barang/delete_barang.php"),
        body: {
          "id_barang": widget.item['id_barang'],
        });

    Map data = jsonDecode(res.body);
    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Success')));
      Navigator.pop(context);
    } else {
      print('Failed');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed')));
      Navigator.pop(context);
    }
  }

  void deleteBarang(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hapus data barang?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: deleteData,
                  child: Text('Ya'),
                  color: Colors.red,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tidak'),
                  color: Colors.green,
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.item != null) {
      namaController = TextEditingController(text: widget.item['nama_barang']);
      jumlahController = TextEditingController(text: widget.item['jumlah']);
      hargaController = TextEditingController(text: widget.item['harga']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                
                  hintText: 'Nama Barang',
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Jumlah',
                  labelText: 'Jumlah',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Harga',
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(height: 50),
            Container(
              width: double.maxFinite,
              height: 45,
              child: MaterialButton(
                onPressed: () {
                  if (widget.item == null) {
                    addData();
                  } else {
                    updateData();
                  }
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                textColor: Colors.white,
                child: Text(
                    widget.item == null ? "Tambahkan Barang" : "Edit Barang"),
              ),
            ),
            SizedBox(height: 10),
            widget.item == null
                ? Container()
                : Container(
                    width: double.maxFinite,
                    height: 45,
                    child: MaterialButton(
                      onPressed: () {
                        deleteBarang(context);
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      textColor: Colors.white,
                      child: Text("Hapus"),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
