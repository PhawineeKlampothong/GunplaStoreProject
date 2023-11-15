import 'package:flutter/material.dart';

class rg extends StatefulWidget {
  const rg({super.key});

  @override
  State<rg> createState() => _rgState();
}

class _rgState extends State<rg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 120,
        titleSpacing: 60,
        leading: BackButton(
            onPressed:(){
              Navigator.popAndPushNamed(context,'/AllProductsPage');
            }
        ),
        title: Text("Real Grade (RG)"),
      ),
    );
  }
}
