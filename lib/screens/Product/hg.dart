import 'package:flutter/material.dart';
import 'package:store/gunpla.dart';

class hg extends StatefulWidget {
  const hg({super.key});

  @override
  State<hg> createState() => _hgState();
}

class _hgState extends State<hg> {
  List<gunpla> pla = [
    gunpla("HG GUNDAM AERIAL", "780.00 บาท"),
    gunpla("SDEX UNICORN GUNDAM (DESTROY MODE)", "230.00 บาท"),
    gunpla("SDEX NU GUNDAM", "240.00 บาท"),
    gunpla("SDEX SAZABI", "240.00 บาท"),
    gunpla("SDEX UNICORN GUNDAM 02 BANSHEE NORN", "240.00 บาท"),
    gunpla("SD BB372 GUNDAM AGE-3", "450.00 บาท"),
    gunpla("SD ZHUGE LIANG FREEDOM GUNDAM", "320.00 บาท"),
    gunpla("SD SUN SHANGXIANG STRIKE ROUGE", "240.00 บาท"),
    gunpla("SD SERGEANT VERDE BUSTER GUNDAM DX SET", "800.00 บาท"),
    gunpla("SD QIONGQI STRIKE FREEDOM GUNDAM", "320.00 บาท"),
    gunpla("SD SHINING GRASPER DRAGON", "280.00 บาท"),
    gunpla("SD ZHAO YUN 00 GUNDAM COMMAND PACKAGE", "400.00 บาท"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 120,
        titleSpacing: 60,
        leading: BackButton(onPressed: () {
          Navigator.popAndPushNamed(context, '/AllProductsPage');
        }),
        title: Text("High Grade (HG)"),
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
            final String image = 'assets/images/hgshop/hg_${index + 1}.jpg';

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
      ),
    );
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
  final String price;

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
                  widget.price,
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
  final String price;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  int _amonut = 0;


  void _pluss() {
    setState(() {
      _amonut++;
    });
  }

  void _minus() {
    setState(() {
      _amonut--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(backgroundColor: Colors.red),
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
                          widget.price,
                          style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            TextButton(onPressed: _minus, child: Text("-",style: TextStyle(fontSize: 30))),
                            SizedBox(width: 30,),
                            Text('$_amonut',style: TextStyle(fontSize: 30),),
                            SizedBox(width: 30,),
                            TextButton(onPressed: _pluss, child: Text("+",style: TextStyle(fontSize: 30))),
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
                onPressed: () {},
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










