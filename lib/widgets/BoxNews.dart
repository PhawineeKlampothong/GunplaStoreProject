import 'package:flutter/material.dart';

class BoxNews extends StatelessWidget {
  final String path;
  final String text;
  final String img;
  final String detail;

  const BoxNews({
    super.key,
    required this.path,
    required this.text,
    required this.img,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Material(
        child: InkWell(
          child: Ink(
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                alignment: Alignment(0, -0.65),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 20, top: 30, end: 20),
              child: Column(
                children: [
                  Container(

                    child: Column(
                      children: [
                        Text(text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellowAccent.shade700),),
                        SizedBox(height: 290,),
                        Text(detail,style: TextStyle(fontSize: 16,color: Colors.white),),
                      ],
                    ),
                  ),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: OutlinedButton(

                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.fromHeight(10),
                              backgroundColor: Colors.red,

                            ),
                            child: Text('เลือกซื้อ >>>',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.popAndPushNamed(context,path);
                            },
                          ),
                        ),
                      ),
                  ),


                ],
              )
            ),
          ),

        ),
        color: Colors.transparent,
      ),
      color: Colors.blue.shade900,
    );
  }
}
