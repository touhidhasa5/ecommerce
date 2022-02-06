import 'package:ecommerce/const/mycolor.dart';
import 'package:ecommerce/ui/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginwidget extends StatefulWidget {
  const Loginwidget({Key? key}) : super(key: key);

  @override
  _LoginwidgetState createState() => _LoginwidgetState();
}

class _LoginwidgetState extends State<Loginwidget> {
  @override
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _obscureText = true;
  signin() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      );
      var authCredenttial = userCredential.user;
      print(authCredenttial!.uid);
      if (authCredenttial.uid.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Homepage()));
      } else {
        Fluttertoast.showToast(msg: "Something went wrong.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('The password provided is too weak.');
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        // print('The account already exists for that email.');
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.mycolor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 22.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.8),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "welcome",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: appcolor.mycolor,
                          ),
                        ),
                        Text(
                          "Glad to see you",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 41.w,
                              decoration: BoxDecoration(
                                  color: appcolor.mycolor,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                hintText: "Enter your email address",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Color(0xFF414041)),
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: appcolor.mycolor,
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 41.w,
                              decoration: BoxDecoration(
                                  color: appcolor.mycolor,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: TextField(
                              controller: _passwordcontroller,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  hintText: "Password must be 8 character",
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF414041)),
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: appcolor.mycolor,
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            size: 20.w,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = true;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: 20.w,
                                          ))),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 1.sw,
                          height: 56.w,
                          child: ElevatedButton(
                            onPressed: () {
                              signin();
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: appcolor.mycolor,
                              elevation: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: appcolor.mycolor,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
