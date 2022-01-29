// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class NotExisted extends StatefulWidget {
  const NotExisted({Key? key}) : super(key: key);

  @override
  _NotExistedState createState() => _NotExistedState();
}

class _NotExistedState extends State<NotExisted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#fa1920"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Icon(Icons.cancel_outlined, color: Colors.red, size: 100),
            SizedBox(
              height: 10,
            ),
            Text(
              "False Information",
              style: GoogleFonts.biryani(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'main');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.arrow_back),
        backgroundColor: HexColor("#fa1920"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
