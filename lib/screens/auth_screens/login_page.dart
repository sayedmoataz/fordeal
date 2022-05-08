// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secondtask/layout/home.dart';
import 'package:secondtask/local/cache_helper.dart';
import 'package:secondtask/screens/auth_screens/sign_up.dart';

import '../../models/auth/login_model.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.8),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    LoginModel? loginModel;
    Future<void> login() async {
      var uri = Uri.https('alhasnaa.site', '/api/login', {
        'phone_email': emailController.text,
        'password': passController.text
      });
      await http.get(uri).then((value) async {
        print(value.body);
        setState(() {
          loginModel = LoginModel.fromJson(jsonDecode(value.body));
        });
        print(loginModel!.userMail);
      }).catchError((e) {
        print(e.toString());
      });
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Navigator.push(context,
                    //       //     MaterialPageRoute(builder: (_) => RegionPage()));
                    //     },
                    //     child: Container(
                    //       padding: const EdgeInsets.all(12),
                    //       height: 60,
                    //       width: double.maxFinite,
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(5)),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text('Region'),
                    //           IconButton(
                    //             icon: Icon(
                    //               Icons.arrow_forward_ios,
                    //               size: 18,
                    //               color: Colors.black.withOpacity(0.8),
                    //             ),
                    //             onPressed: () {},
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل لا يجب ان يكون فارغ';
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'البريد الالكتروني',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: passController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل لا يجب ان يكون فارغ';
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'كلمة السر',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                if (formKey.currentState!.validate()) {
                                  await login().then((value) {
                                    CacheHelper.putData(
                                            key: 'uid',
                                            value: loginModel!.userId)
                                        .then((value) {
                                      emailController.clear;
                                      passController.clear;
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeLayout()),
                                          (route) => false);
                                    });
                                    emailController.clear;
                                    passController.clear;
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }).catchError((e) {
                                    print(e.toString());
                                  });
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'التالي',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    // Center(
                    //   child: Text('Or'),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12),
                    //   child: Container(
                    //     height: 50,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //         color: Colors.blue,
                    //         borderRadius: BorderRadius.circular(30)),
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Container(
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(18)),
                    //             height: 36,
                    //             width: 36,
                    //             child: Image.asset(
                    //               "assets/gIcon.jpg",
                    //               fit: BoxFit.cover,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 8,
                    //           ),
                    //           Text(
                    //             'Continue with Google',
                    //             style: TextStyle(fontSize: 16),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('أليس لديك حساب ؟ '),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text('التسجيل'))
                      ],
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       decoration:
                //           BoxDecoration(borderRadius: BorderRadius.circular(18)),
                //       height: 36,
                //       width: 36,
                //       child: Image.asset(
                //         "assets/fIcon.png",
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Container(
                //       decoration:
                //           BoxDecoration(borderRadius: BorderRadius.circular(18)),
                //       height: 36,
                //       width: 36,
                //       child: Image.asset(
                //         "assets/mIcon.jpg",
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
