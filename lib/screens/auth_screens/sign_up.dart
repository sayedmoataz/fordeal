// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secondtask/screens/auth_screens/login_page.dart';
import 'package:http/http.dart' as http;

import '../../layout/home.dart';
import '../../local/cache_helper.dart';
import '../../models/auth/register_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  bool isLoading = false;
  final GlobalKey<FormState> formKeyS = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController countryZIPController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    RegisterModel? registerModel;
    Future<void> register() async {
      var uri = Uri.https('alhasnaa.site', '/api/registration', {
        'user_name': userNameController.text,
        'country': countryController.text,
        'country_zip': countryZIPController.text,
        'user_phone': phoneController.text,
        'user_mail': emailController.text,
        'password': passController.text
      });
      await http.get(uri).then((value) async {
        print(value.body);
        setState(() {
          registerModel = RegisterModel.fromJson(jsonDecode(value.body));
        });
        print(registerModel!.userMail);
      }).catchError((e) {
        print(e.toString());
      });
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formKeyS,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'التسجيل ',
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
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'البريد الالكتروني',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'كلمة السر',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'اسم المستخدم',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: countryController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: ' اسم الدولة',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: countryZIPController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'ال zip كود',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل لا يجب ان يكون فارغ';
                          }
                        },
                        textInputAction: TextInputAction.done,
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'رقم التليفون',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                if (formKeyS.currentState!.validate()) {
                                  await register().then((value) {
                                    CacheHelper.putData(
                                            key: 'uid',
                                            value: registerModel!.userId)
                                        .then((value) {
                                      if (value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeLayout()),
                                            (route) => false);
                                      }
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('الديك حساب بالفعل ؟'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text('تسجيل الدخول'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
