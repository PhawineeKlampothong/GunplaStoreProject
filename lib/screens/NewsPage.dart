import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/widgets/BoxNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: () {},
              child: const Text(
                'News',
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
          width: 2000,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                      ),
                      height: 1000,
                      width: 1100,
                      child: Column(
                        children: [
                          Text(
                            '''
HG Gundam Calibarn จาก THE WITCH FROM MERCURY 
วางจำหน่ายวันที่ 15 กรกฎาคม! สร้างประกายสีรุ้งขึ้นมาใหม่ด้วยการตกแต่งในแม่พิมพ์!
                      ''',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Image.asset(
                            'assets/images/news/new5.jpg',
                            width: 600,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.all(50.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '''
                     กันพลา Calibarn จาก Mobile Suit Gundam THE WITCH FROM MERCURY จะวางจำหน่ายในวันเสาร์ที่ 15 กรกฎาคม ในราคา2,200 เยน (รวมภาษี)

Gundam Calibarn จาก Mobile Suit Gundam THE WITCH FROM MERCURY เข้าร่วมไลน์อัพ HG เฉดประกายสีรุ้งของ chest Shell Unit และเสาอากาศถูกสร้างขึ้นใหม่ผ่านการตกแต่งในแม่พิมพ์
ชุดคิทรวม portable firearm Variable Rod Rifle (อาวุธหลักของ MS), โล่สีขาว และ display base สำหรับ MS
สามารถรวมเซ็ท 2 เซ็ทของของ THE WITCH FROM MERCURY Weapon Display Bases เพื่อจัดแสดง GUND-Bits''',
                                  style: TextStyle(fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                      ),
                      height: 1300,
                      width: 1100,
                      child: Column(
                        children: [
                          Text(
                            '''
Gundam Metaverse เปิดให้บริการในช่วงเวลาจำกัดในประเทศญี่ปุ่นและสหรัฐอเมริกา 
เริ่มวันที่ 6 ตุลาคมนี้! ลงทะเบียนล่วงหน้าเริ่มต้นวันนี้!
                      ''',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Image.asset(
                            'assets/images/news/new2.jpg',
                            width: 600,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.all(50.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '''
                    Gundam Metaverse จะเปิดให้บริการในช่วงเวลาจำกัดในญี่ปุ่นและสหรัฐอเมริกา เริ่มตั้งแต่วันศุกร์ที่ 6 ตุลาคม ถึงวันอังคารที่ 17 ตุลาคม และเริ่มการลงทะเบียนล่วงหน้าตั้งแต่วันนี้

Bandai Namco Group ตั้งเป้าที่จะทำงานร่วมกับแฟน ๆ เพื่อสร้าง Gundam Metaverse ที่แฟน ๆ กันดั้มจากทั่วทุกมุมโลกสามารถรวบรวม พูดคุย และสัมผัสประสบการณ์อะนิเมะและกันพลา รวมถึงเพลิดเพลินกับ UGC (เนื้อหาที่ผู้ใช้สร้างขึ้น) เช่นผลงานชิ้นเอกและอาร์ตเวิร์กของกันพลาสร้างขึ้นโดยแฟน ๆ

ในช่วงระยะเวลาที่จำกัด จะมีพื้นที่ 3 มิติที่ผู้เข้าชมสามารถดื่มด่ำไปกับโลกของกันดั้ม ร้านค้า EC ที่สามารถซื้อ กันพลาแบบจำกัดอีเว้นท์ได้ 6 แบบ และพื้นที่ที่จะมีการแสดงสดแบบดิจิทัลโดยศิลปินที่เกี่ยวข้อง ไปจนถึงชื่อกันดั้ม เนื้อหาหลักของ Gundam Metaverse จะเป็นพิพิธภัณฑ์ UGC ที่ซึ่งภาพถ่ายของกันพลา สร้างขึ้นโดยผู้ใช้, การสแกน CG ของ กันพลาและวิดีโอแนะนำเคล็ดลับในการปรับแต่งกันพลา

นอกจากนี้ ฟีเจอร์ GUNPLA Scan ที่สร้างขึ้นจากความร่วมมือระหว่าง Bandai Namco Group และ Sony Group และ Mellow ซึ่งเป็นตัวละคร AI ที่ช่วยให้ผู้ใช้สื่อสารระหว่างกันก็จะถูกนำไปใช้ด้วยเช่นกัน นอกจากนี้ยังมีเนื้อหาความบันเทิง เช่น ไดโอราม่าพร้อมเอฟเฟกต์ดิจิทัลที่ไม่เหมือนใครในโลกนี้
อย่าลืมลงทะเบียนล่วงหน้าและดำดิ่งสู่โลกของ Gundam Metaverse

รายงานต่อเนื่องของ GUDAM UNIVERSAL CENTURY DEVELOPMENT ACTION (GUDA) ซึ่งเป็นโปรเจ็กต์ที่ BANDAI NAMCO Group กำลังส่งเสริมเพื่อทำงานร่วมกับแฟนๆ และพันธมิตรภายนอกเพื่อประโยชน์ของเด็กๆ ในอนาคต ดังนั้นอย่าลืมตรวจสอบด้วยเช่นกัน''',
                                  style: TextStyle(fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      height: 950,
                      width: 1100,
                      child: Column(
                        children: [
                          Text(
                            '''
กันพลา, METAL ROBOT SPIRITS และไอเทมใหม่อีกเพียบประกอบด้วย Mobile 
Suit Gundam SEED FREEDOM เริ่มจัดแสดงแล้วที่ GUNDAM NEXT FUTURE!
                      ''',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Image.asset(
                            'assets/images/news/new3.jpg',
                            width: 600,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(50.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '''
                     ไอเทมใหม่ๆ อาทิเช่น กันพลา และ METAL ROBOT SPIRITS ประกอบด้วย Mobile Suit Gundam SEED FREEDOM ภาพยนตร์ที่จะเข้าฉายในโรงภาพยนตร์ทั่วประเทศญี่ปุ่นตั้งแต่วันศุกร์ที่ 26 มกราคม 2024 เพิ่งจะเปิดตัว

ไอเทมบางชิ้นจะถูกจัดแสดงเป็นครั้งแรกที่ GUNDAM NEXT FUTURE -EAST- ซึ่งจะเริ่มในวันศุกร์ที่ 6 ตุลาคม ที่ Sankaku Hiroba ในอาคาร Shinjuku Sumitomo ในโตเกียว นอกจากนี้ยังจัดแสดงที่ GUNDAM NEXT FUTURE -WEST- ซึ่งเป็นอีเวนต์เดียวกันที่จะจัดขึ้นที่ Grand Front Osaka ตั้งแต่วันเสาร์ที่ 14 ตุลาคม
ทั้งสองกิจกรรมสามารถเข้าร่วมได้ฟรี ดังนั้นอย่าลืมแวะไปดูด้วยล่ะ''',
                                  style: TextStyle(fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      height: 1300,
                      width: 1100,
                      child: Column(
                        children: [
                          Text(
                            '''
Gundam Build World เริ่มต้นที่ร้าน THE GUNDAM ตั้งแต่วันที่ 15 กันยายน! 
เพลิดเพลินไปกับนิทรรศการพิเศษ, แข่งขันลอตเตอรี่กาชาปอง และอื่นๆอีกเพียบ!
                      ''',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Image.asset(
                            'assets/images/news/new4.jpg',
                            width: 600,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(50.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '''
                     งานกิจกรรม Gundam Build World เพื่อฉลองครบรอบ 10 ปีของซีรีส์ Gundam Build จะจัดขึ้นที่ร้าน THE GUNDAM BASE, ร้านขายกันพลาทั่วไป เริ่มในวันศุกร์ที่ 15 กันยายน

งานกิจกรรมนี้นำเสนอนิทรรศการพิเศษซีรีส์ Gundam Build ที่แนะนำผลงานจากซีรีส์ Gundam Build, “HOW TO BUILD ~GUNPLA Creation Roadmap~" และผลงานชิ้นเอกที่สร้างสรรค์โดย Meijin Kawaguchi นอกจากนี้ ร้านค้าในโตเกียวยังมีมุมถ่ายรูปที่คุณสามารถถ่ายรูปได้ พร้อมด้วยรูปปั้นของ Sei, Reiji และ Mao

ร้านค้าในโตเกียวและฟุกุโอกะจะจัดงาน Garapon Lottery Challenges ซึ่งคุณสามารถรับรางวัล GUNPLA และ Gundam marker หนึ่งครั้งต่อหนึ่งใบเสร็จ เมื่อซื้อสินค้ารวมตั้งแต่ 3,000 เยนขึ้นไป (รวมภาษี) เมื่อซื้อ GUNPLA Build Series หนึ่งชิ้นขึ้นไป

นอกจากนี้ยังมีการแข่งขัน GUNPLA, เวิร์คช็อปการประกอบ GUNPLA/Kitbashing, บทเรียน GUNPLA สำหรับผู้ปกครองและเด็ก: “มาเป็นปรมาจารย์ด้านการวาดภาพ” และเซสชั่นการสร้าง GUNPLA SCAN MOVIE ดังนั้นอย่าลืมแวะมาดู''',
                                  style: TextStyle(fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      height: 1250,
                      width: 1100,
                      child: Column(
                        children: [
                          Text(
                            '''
Real Type Color Ver. MG Freedom Gundam Ver.2.0 
และ MG Justice วางจำหน่ายภายใน Gundam Metaverse 
ตั้งแต่กลางเดือนตุลาคม!
                      ''',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Image.asset(
                            'assets/images/news/new1.jpg',
                            width: 600,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(50.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '''
                     Real Type Color GUNPLA ของ Freedom Gundam และ Justice Gundam ออกแบบโดย Kunio Okawara จะวางจำหน่ายในช่วงกลางเดือนตุลาคมภายใน Gundam Metaverse เพื่อฉลองครบรอบ 20 ปีของ Mobile Suit Gundam SEED

กันพลาทั้งสองนี้เป็นไอเทมลิมิเต็ดของ GUNDAM NEXT FUTURE การเข้าถึง Gundam Metaverse ก่อนใคร ซึ่งเป็นสถานที่ดิจิทัลของ GUNDAM NEXT FUTURE เริ่มตั้งแต่วันนี้ในวันศุกร์ที่ 6 ตุลาคมในญี่ปุ่นและสหรัฐอเมริกา โดยรับผู้เข้าร่วมจำนวนจำกัด การเข้าถึงแบบทั่วไปจะเปิดให้บริการในช่วงกลางเดือนตุลาคม โดยไม่จำกัดจำนวนผู้เข้าร่วม กันพลารุ่นลิมิเต็ดจะวางจำหน่ายหลังจากเปิดให้เข้าถึงทั่วไปแล้ว

ไอเทมทั้งหมด 6 ชิ้นมีกำหนดจะปรากฏในไลน์อัพ GUNDAM NEXT FUTURE Limited GUNPLA ดังนั้นโปรดติดตามชมกันให้ดี

บทสัมภาษณ์ของ Kunio Okawara ที่พูดถึง Real Type Color GUNPLA จะถูกเปิดเผยบนเว็บ Hobby Japan ดังนั้นอย่าลืมตรวจสอบรายละเอียดเพิ่มเติมในเว็บไซต์พิเศษ''',
                                  style: TextStyle(fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
