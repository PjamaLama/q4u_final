import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q4u_final/pages/barcode_scanner.dart';
import 'package:q4u_final/pages/get_details_stepper.dart';
import 'package:q4u_final/pages/login_page.dart';
import 'package:q4u_final/pages/vehicles_page.dart';

// import 'pages/login_page.dart';
// import 'pages/get_details_stepper.dart';
// import 'widgets/segmented_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // home: LoginPage(),
      home: GetDetailsStepper(),
      // home: BarcodeScanner(title: 'Scan License Disk Barcode'),
      // home: VehiclesPage(),
    );
  }
}
