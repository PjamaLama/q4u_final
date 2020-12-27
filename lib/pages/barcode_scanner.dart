import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:regexpattern/regexpattern.dart';

class BarcodeScanner extends StatefulWidget {
  BarcodeScanner({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _barcode, _value = "", _vehicleRegNo = "", _licenseNo = "";

  Future scanBarcode() async {
    _barcode = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.BARCODE);

    RegExp vin =
        new RegExp(r"%[A-Z]{5}.{12}", caseSensitive: false, multiLine: false);
    RegExpMatch _vin = vin.firstMatch(_value);

    setState(() {
      // _value = _barcode;
      _value = _vin.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Disk Barcode',
              ),
              Text(
                _value,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: scanBarcode,
          tooltip: 'Scan Barcode',
          child: Icon(
            Icons.settings_overscan,
          ),
        ));
  }
}
