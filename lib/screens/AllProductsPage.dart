import 'package:flutter/material.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        titleSpacing: 60,
        title: Text(
          "GunplaStore",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/HomePage');
            },
            child: const Text(
              'News',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text(
              'All Products',
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.white,
                      offset: Offset(0, -5))
                ],
                color: Colors.transparent,
                decoration:
                TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 4,
                fontSize: 30,
              ),
            ),
          ),
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/PromotionPage');
            },
            child: const Text(
              'Promotion',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/NewPage');
            },
            child: const Text(
              'New Arrivals',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('blank'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),

        child: Container(
          height: 500,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 500,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),);
  }
}
