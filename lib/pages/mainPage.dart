// ignore_for_file: file_names, prefer_const_constructors

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:dart_grpc_api/grpc_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pass_vaccinal_verification/controllers/ownerController.dart';
import 'package:pass_vaccinal_verification/fetchingData/data.dart';
import 'package:pass_vaccinal_verification/pages/existedQr.dart';
import 'package:pass_vaccinal_verification/pages/notExistedQr.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController nationalidentitytextEditingController =
      TextEditingController();
  TextEditingController fullNametextEditingController = TextEditingController();
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context, listen: true);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor("#132DA1"),
              HexColor("#132DA1"),
              HexColor("#fffff")
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/qrCode.png"),
                    width: 300,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Verify The Vaccination Pass",
                    style: GoogleFonts.biryani(
                      fontSize: 24,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nationalidentitytextEditingController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "National identity",
                            labelStyle: const TextStyle(fontSize: 16),
                            hintStyle: const TextStyle(
                                fontSize: 10, color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: fullNametextEditingController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "Name",
                            labelStyle: const TextStyle(fontSize: 16),
                            // ignore: prefer_const_constructors
                            hintStyle: const TextStyle(
                                fontSize: 10, color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          String codeSanner =
                              await BarcodeScanner.scan(); //barcode scanner
                          setState(() {
                            qrCodeResult = codeSanner;
                          });

                          //la logique de verification
                          if (findOwnerByQrHAsh(
                                  qrCodeResult,
                                  nationalidentitytextEditingController.text
                                      .toString(),
                                  fullNametextEditingController.text
                                      .toString()) &&
                              contractLink.verifyOwner(qrCodeResult)) {
                            Navigator.pushNamed(context, 'existed');
                          } else {
                            Navigator.pushNamed(context, 'notExisted');
                          }
                          fullNametextEditingController.clear();
                          nationalidentitytextEditingController.clear();
                        },
                        color: HexColor("#132DA1"),
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Scan QR code",
                              style: GoogleFonts.biryani(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
