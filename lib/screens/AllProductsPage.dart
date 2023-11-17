import 'package:flutter/material.dart';
import 'package:store/widgets/BoxNews.dart';
import 'package:store/gunpla.dart';

class CartItem {
  final String name;
  final int price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
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
          quantity: cartItems[existingIndex].quantity + quantity,
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

  void _showCart() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shopping cart'),
          content: Column(
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
                  Text('Total:'),
                  Text(
                      '\$${cartItems.fold(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}'),
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
                // Perform checkout or other actions
              },
            ),
          ],
        );
      },
    );
  }

  ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
    return IconButton.styleFrom(
      foregroundColor: selected ? colors.onPrimary : colors.primary,
      backgroundColor: selected ? colors.primary : colors.surfaceVariant,
      disabledForegroundColor: colors.onSurface.withOpacity(0.38),
      disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
      hoverColor: selected
          ? colors.onPrimary.withOpacity(0.08)
          : colors.primary.withOpacity(0.08),
      focusColor: selected
          ? colors.onPrimary.withOpacity(0.12)
          : colors.primary.withOpacity(0.12),
      highlightColor: selected
          ? colors.onPrimary.withOpacity(0.12)
          : colors.primary.withOpacity(0.12),
    );
  }

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
            onPressed: () {},
            child: const Text(
              'All Products',
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
                  color: Colors.white, fontSize: 30, fontFamily: 'Jose1'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(''),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 90, top: 60, end: 20, bottom: 60),
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 300,
                child: BoxNews(
                    path: "/sd",
                    text: "SD",
                    img: "assets/images/news/HSD.png",
                    detail:
                        '''           Super Deform (SD Gundam) Gundam SD จริงๆ แล้วโมเดล Gundam SD นั้นจัดเป็นพวกไม่มีเกรด และไม่มีอัตราส่วน เป็นโมเดล Gundam ที่หัวโต ตัวเล็ก แขนขาสั้น แต่น่ารัก มีการแยกสีน้อยทำให้ต้องทำสีหรือติดสติกเกอร์หลายส่วน มีจุดขยับน้อย และด้วยความที่ตัวเล็กจึงมีรายละเอียดน้อย จึงเหมาะสำหรับมือใหม่หรือเด็กๆ ที่เริ่มหัดเล่น '''),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 300,
                child: BoxNews(
                  path: "/hg",
                  text: "HG",
                  img: "assets/images/news/HHG.png",
                  detail:
                      '''           High Grade (HG) จะผลิตในอัตราส่วน 1/144 ซึ่งมีขนาดเล็ก มีการแยกสีและจุดขยับต่างๆ มีรายระเอียดในระดับหนึ่ง อาจจะมีจุดที่ต้องทำสีเพิ่มหรือติดสติกเกอร์เพื่อให้สีสมจริงขึ้นมีความรายละเอียดสวยงามใกล้เคียงกับใน แอนนิเมชั่น ราคาไม่สูงมากแต่ในปัจจุบันก็มี HG 1/144 บางตัวที่มีราคาสูงจากราคามาตรฐานไปมาก''',
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 300,
                child: BoxNews(
                    path: "/rg",
                    text: "RG",
                    img: "assets/images/news/HRG.png",
                    detail:
                        '''           Real Grade (RG) เป็น Gunpla ที่มีขนาดเท่ากันกับ High Grade (HG) แต่มีจุดเด่นที่รายละเอียดในระดับสูงมากๆ ผลิตในอัตราส่วน 1/144 ที่มีขนาดเล็ก โดยคนส่วนใหญ่ให้ความเห็นว่ารายละเอียดมากว่า Master Grade (MG) เสียอีก ปัจจุบันมีให้เลือกสะสมหลายแบบมาก'''),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 300,
                child: BoxNews(
                    path: "/mg",
                    text: "MG",
                    img: "assets/images/news/HMG.png",
                    detail:
                        '''           Master Grade (MG) เป็น Gunpla ที่ผลิตในอัตราส่วน 1/100 มีการแยกสีมาดีมากๆ โดยเฉพาะรุ่นใหม่ๆ อาจจะไม่ต้องทำสีหรือติดสติกเกอร์ก็ได้สีตรงกับของจริง แทบไม่มีชิ้นส่วนประกบคู่ให้เห็นรอยต่อ มีจุดขยับที่ดีกว่า High Grade (HG) มาก บางตัวสามารถคุกเข่าหรือกอดอกได้เลยทีเดียว มีรายละเอียดสูงมักจะมีการออกแบบเพิ่ม Detail เข้าไปใหม่ โดยมีรายละเอียดลึกถึงในระดับโครงใน (Inner Frame) ของตัวหุ่น ราคาสูงในระดับหนึ่ง'''),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                width: 300,
                child: BoxNews(
                    path: "/pg",
                    text: "PG",
                    img: "assets/images/news/HPG.png",
                    detail:
                        '''           Perfect Grade (PG) เป็น Gunpla ที่ผลิตในอัตราส่วน 1/60 การแยกสี จุดขยับ เหนือกว่า Master Grade (MG) อยู่มากเช่นส่วนมือจะสามารถขยับนิ้วได้ทุกข้อเลย และมีส่วนโครงใน (Inner Frame) ที่มีรายละเอียด ความสวยงามและความซับซ้อนสูงอีกเช่นกัน มีระบบไฟตามจุดต่างๆ เช่นที่ดวงตาและหน้าอก โดย Perfect Grade (PG) นั้นจะมีแบบให้เลือกน้อยกว่าขนาดอื่นๆ เพราะจะผลิตเฉพาะตัวที่เด่นเท่านั้น จึงมีราคาที่สูงตามความละเอียดของชิ้นงานอยู่มาก'''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
