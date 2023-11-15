import 'package:flutter/material.dart';
import 'package:store/screens/HomePage.dart';
import 'package:store/screens/AllProductsPage.dart';
import 'package:store/screens/PromotionPage.dart';
import 'package:store/screens/NewPage.dart';
import 'package:store/screens/Product/sd.dart';
import 'package:store/screens/Product/hg.dart';
import 'package:store/screens/Product/rg.dart';
import 'package:store/screens/Product/mg.dart';
import 'package:store/screens/Product/pg.dart';

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
        '/sd': (context) => sd(),
        '/hg': (context) => hg(),
        '/rg': (context) => rg(),
        '/mg': (context) => mg(),
        '/pg': (context) => pg(),
      },

    );
  }
}
