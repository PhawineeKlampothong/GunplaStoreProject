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
                        Text(text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 300,),
                        Text(detail),
                      ],
                    ),
                  ),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 50),
                        child: Align(

                          alignment: Alignment.bottomCenter,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.fromHeight(60),
                            ),
                            child: Text('All >>>',style: TextStyle(fontSize: 30),),
                            onPressed: () {
                              Navigator.popAndPushNamed(context,path);
                            },
                          )
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
      color: Colors.lightBlue.shade100,
    );
  }
}
