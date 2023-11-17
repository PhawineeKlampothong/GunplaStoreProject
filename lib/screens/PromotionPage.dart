import 'package:flutter/material.dart';
import 'package:store/gunpla.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  List<promo> pla = [
    promo("SDEX RISING FREEDOM GUNDAM", 210,240),
    promo("MOTOR NUCLEAR MNP-XH03 AOBING AZURE DRAGON (ELITE VERSION)", 2890,3890),
    promo("FULL ARMOR DUSSAK", 3290,3900),
    promo("MOTOR NUCLEAR MNQ-07 NIU MO WANG", 13300,15500),
    promo("IRON TOYS STAR DESTROYER", 1250,1490),
    promo("TIAN WEI", 1890,2500),
    promo("HG PLUTINE GUNDAM", 780,920),
    promo("MOTOR NUCLEAR MNP-XH04 NE ZHA", 1350,1990),
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
          style:
              TextStyle(fontSize: 50, color: Colors.white, fontFamily: 'Jose1'),
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
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1',),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/AllProductsPage');
            },
          ),
          SizedBox(width: 40),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text(
              'Promotion',
              style: TextStyle(
                  shadows: [Shadow(color: Colors.white, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 4,
                  fontSize: 30,
                  fontFamily: 'Jose1'),
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
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1'),
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
            childAspectRatio: 11 / 16,
          ),
          itemBuilder: (context, index) {
            promo gun = pla[index];
            final String image = 'assets/images/Prshop/pr_${index + 1}.jpg';

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
                        pro: gun.pro,
                      ),
                    ),
                  );
                },
                child: PlantItem(
                  image: image,
                  name: gun.name,
                  price: gun.price,
                  pro: gun.pro,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlantItem extends StatefulWidget {
  const PlantItem(
      {super.key,
        required this.price,
        required this.name,
        required this.image,
        required this.pro});

  final String name;
  final String image;
  final int price;
  final int pro;

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
                  style: textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'พิเศษ ราคา '+widget.price.toString() + ' บาท',
                  style: textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red),
                ),
                Text(
                  'ปกติ ราคา '+widget.pro.toString() + ' บาท',
                  style: textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,decoration: TextDecoration.lineThrough,),
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
        required this.image,
        required this.pro});

  final String name;
  final String image;
  final int price;
  final int pro;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class CartItem {
  final String name;
  final int price;
  final int pro;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.pro,
    required this.quantity,
  });
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  List<CartItem> cartItems = [];

  // ฟังก์ชันเพิ่มรายการในตะกร้า
  void _addToCart(String name, int price, int quantity,int pro) {
    // ตรวจสอบว่ารายการนี้มีอยู่ในตะกร้าแล้วหรือไม่
    int existingIndex = cartItems.indexWhere((item) => item.name == name);

    if (existingIndex != -1) {
      // หากมีอยู่แล้วให้เพิ่มจำนวน
      setState(() {
        cartItems[existingIndex] = CartItem(
          name: name,
          price: price,
          pro: pro,
          quantity: cartItems[existingIndex].quantity = quantity,
        );
      });
    } else {
      // ถ้ายังไม่มีให้เพิ่มรายการใหม่
      setState(() {
        cartItems.add(CartItem(
          name: name,
          price: price,
          pro: pro,
          quantity: quantity,
        ));
      });
    }
  }

  void _removefromCart(String name, int price, int quantity,int pro) {
    // ตรวจสอบว่ารายการนี้มีอยู่ในตะกร้าแล้วหรือไม่
    int existingIndex = cartItems.indexWhere((item) => item.name == name);

    if (existingIndex != -1) {
      // หากมีอยู่แล้วให้เพิ่มจำนวน
      setState(() {
        cartItems[existingIndex] = CartItem(
          name: name,
          price: price,
          pro: pro,
          quantity: cartItems[existingIndex].quantity = quantity,
        );
      });
    } else {
      // ถ้ายังไม่มีให้เพิ่มรายการใหม่
      setState(() {
        cartItems.add(CartItem(
          name: name,
          price: price,
          pro: pro,
          quantity: quantity,
        ));
      });
    }
  }

  void _pay() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ข้อมูลการชำระเงิน'),
          icon: const Icon(Icons.money_off_csred_sharp),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Column(
                children: cartItems
                    .map((item) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('รายการสินค้า'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('${item.name}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('คำสั่งซื้อ ( ${item.quantity} ชิ้น )'),
                        Text(
                          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                        ),
                      ],
                    )
                  ],
                ))
                    .toList(),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ยอดชำระเงินทั้งหมด :'),
                  Text(
                      '\$${cartItems.fold(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}'),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ชำระเงินโดย :'),
                  Text('VISA'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('สั่งสินค้า'),
              onPressed: _checkout,
            ),
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _checkout() {
    String enteredText = "ชำระเงินเสร็จสิ้น";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ยืนยันการชำระเงิน",style: TextStyle(color: Colors.green.shade800),),
          content: Text("คุณ : $enteredText"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/PromotionPage');
              },
              child: Text("ตกลง"),
            ),
          ],
        );
      },
    );
  }

  void _showCart() {
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
                children: cartItems
                    .map((item) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.quantity} x ${item.name}'),
                    Text(
                        '\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                  ],
                ))
                    .toList(),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ชำระเงิน :'),
                  Text(
                      '\$${cartItems.fold(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ซื้อสินค้า'),
              onPressed: _pay,
            ),
            TextButton(
              child: const Text('ยกเลิก'),
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

  void _pluss(String name, int price,int pro) {
    setState(() {
      _amonut++;
    });
    _addToCart(name, price, _amonut,pro);
  }

  void _minus(String name, int price,int pro) {
    if (_amonut == 0) {
    } else {
      setState(() {
        _amonut--;
      });
    }
    _removefromCart(name, price, _amonut,pro);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Colors.blue.shade900,
          ),
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
                          'พิเศษ '+widget.price.toString() + ' บาท',
                          style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        Text(
                          'ปกติ '+widget.pro.toString() + ' บาท',
                          style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.grey,decoration: TextDecoration.lineThrough,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _minus(widget.name, widget.price,widget.pro);
                                },
                                child:
                                Text("-", style: TextStyle(fontSize: 30))),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '$_amonut',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextButton(
                                onPressed: () {
                                  _pluss(widget.name, widget.price,widget.pro);
                                },
                                child:
                                Text("+", style: TextStyle(fontSize: 30))),
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
                onPressed: _showCart,
                icon: const Icon(Icons.attach_money_sharp),
                label: const Text(
                  "หยิบลงตะกร้า",
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
                                  onPressed: _pay,
                                  child: const Text(
                                    'ยืนยัน',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'ยกเลิก',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "ซื้อเลย",
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

