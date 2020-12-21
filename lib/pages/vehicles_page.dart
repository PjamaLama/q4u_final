import 'package:flutter/material.dart';

class VehiclesPage extends StatefulWidget {
  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Vehicles"),
      ),
      body: Column(
        children: [Text("Tap To Renew")],
      ),
    );
  }
}
