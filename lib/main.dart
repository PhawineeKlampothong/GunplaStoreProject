import 'package:flutter/material.dart';
import 'package:store/screens/HomePage.dart';
import 'package:store/screens/AllProductsPage.dart';
import 'package:store/screens/PromotionPage.dart';
import 'package:store/screens/NewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GunplaStore',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => HomePage(),
        '/AllProductsPage': (context) => AllProductsPage(),
        '/PromotionPage': (context) => PromotionPage(),
        '/NewPage': (context) => NewPage(),
      },

    );
  }
}
