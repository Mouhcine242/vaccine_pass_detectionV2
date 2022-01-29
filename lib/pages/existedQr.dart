// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Existed extends StatefulWidget {
  const Existed({Key? key}) : super(key: key);

  @override
  _ExistedState createState() => _ExistedState();
}

class _ExistedState extends State<Existed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#40f570"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
            SizedBox(
              height: 10,
            ),
            Text("Code QR verified",
                style: GoogleFonts.biryani(
                  fontSize: 25,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'main');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.arrow_back),
        backgroundColor: HexColor("#40f570"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
