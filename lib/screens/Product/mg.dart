import 'package:flutter/material.dart';
class mg extends StatefulWidget {
  const mg({super.key});

  @override
  State<mg> createState() => _mgState();
}

class _mgState extends State<mg> {
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
        title: Text("Master Grade (MG)"),
      ),
    );
  }
}
