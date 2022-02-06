import 'dart:async';

import 'package:ecommerce/const/mycolor.dart';
import 'package:ecommerce/ui/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class startwidget extends StatefulWidget {
  const startwidget({Key? key}) : super(key: key);

  @override
  _startwidgetState createState() => _startwidgetState();
}

class _startwidgetState extends State<startwidget> {
  void initstate() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => Loginwidget())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.mycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "E-Commerce",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 44.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
