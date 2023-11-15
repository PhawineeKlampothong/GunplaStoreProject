import 'package:flutter/material.dart';
class pg extends StatefulWidget {
  const pg({super.key});

  @override
  State<pg> createState() => _pgState();
}

class _pgState extends State<pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 120,
        leading: BackButton(
            onPressed:(){
              Navigator.popAndPushNamed(context,'/AllProductsPage');
            }
        ),
        titleSpacing: 60,
        title: Text("Perfect Grade (PG)"),
      ),
    );
  }
}
