import 'package:flutter/material.dart';
import 'package:store/gunpla.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<gunpla> pla = [
    gunpla("SDEX GUNDAM EXIA", 240),
    gunpla("SDEX UNICORN GUNDAM (DESTROY MODE)", 230),
    gunpla("SDEX NU GUNDAM", 240),
    gunpla("SDEX SAZABI", 240),
    gunpla("SDEX UNICORN GUNDAM 02 BANSHEE NORN", 240),
    gunpla("SD BB372 GUNDAM AGE-3", 450),
    gunpla("SD ZHUGE LIANG FREEDOM GUNDAM", 320),
    gunpla("SD SUN SHANGXIANG STRIKE ROUGE", 240),
    gunpla("SD SERGEANT VERDE BUSTER GUNDAM DX SET", 800),
    gunpla("SD QIONGQI STRIKE FREEDOM GUNDAM", 320),
    gunpla("SD SHINING GRASPER DRAGON", 280),
    gunpla("SD ZHAO YUN 00 GUNDAM COMMAND PACKAGE", 400),
  ];
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 120,
        titleSpacing: 60,
        title: Text(
          "GunplaStore",
          style: TextStyle(
              fontSize: 50, color: Colors.white, fontFamily: 'Jose1'),
        ),
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/HomePage');
            },
            child: const Text(
              'News',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1'),
            ),
          ),
          SizedBox(width: 40),
          TextButton(
            style: style,
            child: const Text(
              'All Products',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1'),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/AllProductsPage');
            },
          ),
          SizedBox(width: 40),
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/PromotionPage');
            },
            child: const Text(
              'Promotion',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1'),
            ),
          ),
          SizedBox(width: 40),
          TextButton(
            style: style,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/NewPage');
            },
            child: const Text(
              'New Arrivals',
              style: TextStyle(
                  shadows: [
                    Shadow(color: Colors.white, offset: Offset(0, -5))
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 4,
                  fontSize: 30,
                  fontFamily: 'Jose1'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(''),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          itemCount: pla.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 11 / 14,
          ),
          itemBuilder: (context, index) {
            gunpla gun = pla[index];
            final String image = 'assets/images/sdshop/sd_${index + 1}.jpg';

            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlantDetailsPage(
                        image: image,
                        name: gun.name,
                        price: gun.price,
                      ),
                    ),
                  );
                },
                child: PlantItem(
                  image: image,
                  name: gun.name,
                  price: gun.price,
                ),
              ),
            );
          },
        ),
      ),);
  }
}


class PlantItem extends StatefulWidget {
  const PlantItem(
      {super.key,
        required this.price,
        required this.name,
        required this.image});

  final String name;
  final String image;
  final int price;

  @override
  State<PlantItem> createState() => _PlantItemState();
}

class _PlantItemState extends State<PlantItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Hero(
      tag: widget.image,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.price.toString()+' บาท',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage(
      {super.key,
        required this.price,
        required this.name,
        required this.image});

  final String name;
  final String image;
  final int price;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class CartItem {
  final String name;
  final int price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {

  List<CartItem> cartItems = [];

  // ฟังก์ชันเพิ่มรายการในตะกร้า
  void _addToCart(String name, int price, int quantity) {
    // ตรวจสอบว่ารายการนี้มีอยู่ในตะกร้าแล้วหรือไม่
    int existingIndex = cartItems.indexWhere((item) => item.name == name);

    if (existingIndex != -1) {
      // หากมีอยู่แล้วให้เพิ่มจำนวน
      setState(() {
        cartItems[existingIndex] = CartItem(
          name: name,
          price: price,
          quantity: cartItems[existingIndex].quantity = quantity,
        );
      });
    } else {
      // ถ้ายังไม่มีให้เพิ่มรายการใหม่
      setState(() {
        cartItems.add(CartItem(
          name: name,
          price: price,
          quantity: quantity,
        ));
      });
    }
  }

  void _removefromCart(String name, int price, int quantity) {
    // ตรวจสอบว่ารายการนี้มีอยู่ในตะกร้าแล้วหรือไม่
    int existingIndex = cartItems.indexWhere((item) => item.name == name);

    if (existingIndex != -1) {
      // หากมีอยู่แล้วให้เพิ่มจำนวน
      setState(() {
        cartItems[existingIndex] = CartItem(
          name: name,
          price: price,
          quantity: cartItems[existingIndex].quantity = quantity,
        );
      });
    } else {
      // ถ้ายังไม่มีให้เพิ่มรายการใหม่
      setState(() {
        cartItems.add(CartItem(
          name: name,
          price: price,
          quantity: quantity,
        ));
      });
    }
  }

  void _showCart()  {

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shopping cart'),
          icon: const Icon(Icons.shopping_cart_rounded),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Column(
                children: cartItems.map((item) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.quantity} x ${item.name}'),
                    Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                  ],
                )).toList(),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:'),
                  Text('\$${cartItems.fold(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Checkout'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int _amonut = 0;

  void _pluss(String name,int price) {
    setState(() {
      _amonut++;
    });
    _addToCart(name, price, _amonut);
  }

  void _minus(String name,int price) {
    if(_amonut == 0){

    } else {
      setState(() {
        _amonut--;
      });
    }
    _removefromCart(name, price, _amonut);

  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: widget.image,
                  child: Image.asset(
                    widget.image,
                    height: 500,
                    width: 500,
                    fit: BoxFit.fill,
                  ),
                ),
                MaterialBanner(

                  content: Padding(

                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          widget.price.toString()+' บาท',
                          style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            TextButton(onPressed: (){_minus(widget.name,widget.price);}, child: Text("-",style: TextStyle(fontSize: 30))),
                            SizedBox(width: 30,),
                            Text('$_amonut',style: TextStyle(fontSize: 30),),
                            SizedBox(width: 30,),
                            TextButton(onPressed: (){_pluss(widget.name,widget.price);}, child: Text("+",style: TextStyle(fontSize: 30))),
                          ],
                        ),

                      ],

                    ),
                  ),
                  actions: [
                    ActionChip(label: Text("+")),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: _showCart ,
                icon: const Icon(Icons.attach_money_sharp),
                label: const Text(
                  "ซื้อเลย",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 200.0,
                child: FilledButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('ยืนยัน',style: TextStyle(fontSize: 30),),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('ยกเลิก',style: TextStyle(fontSize: 30,color: Colors.red),),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "หยิบลงตะกร้า",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
