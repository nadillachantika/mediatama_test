import 'package:flutter/material.dart';
import 'package:mediatama_tes/chart_page.dart';
import 'package:mediatama_tes/home_page.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartPage()));
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text('Chart')),
              ),
            ),
            GestureDetector(
              onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text('Barang')),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
