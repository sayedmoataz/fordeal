import 'package:flutter/material.dart';
import 'package:secondtask/screens/details_page.dart';
import 'package:flutter/material.dart';

import 'auth_screens/login_page.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.8),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            width: double.maxFinite,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: height * 0.14,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Orders',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: Row(
                          children: [
                            Text("View All"),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomIcons(
                        iconName: 'Bending',
                        icona: Icons.shop_2_outlined,
                      ),
                      BottomIcons(
                        iconName: 'Preparing',
                        icona: Icons.shop_2_outlined,
                      ),
                      BottomIcons(
                        iconName: 'Shipped',
                        icona: Icons.shop_2_outlined,
                      ),
                      BottomIcons(
                        iconName: 'Review',
                        icona: Icons.shop_2_outlined,
                      ),
                      BottomIcons(
                        iconName: 'Return',
                        icona: Icons.arrow_circle_down_outlined,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: height * 0.2,
              width: double.maxFinite,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8, crossAxisCount: 4, mainAxisSpacing: 8),
                children: [
                  Column(
                    children: [
                      Icon(Icons.wallet),
                      SizedBox(height: 3,),
                      Text('wallet')
                    ],
                  ),  Column(
                    children: [
                      Icon(Icons.co_present_outlined),
                      SizedBox(height: 3,),
                      Text('coupon')
                    ],
                  ),  Column(
                    children: [
                      Icon(Icons.location_on_rounded),
                      SizedBox(height: 3,),
                      Text('address')
                    ],
                  ),  Column(
                    children: [
                      Icon(Icons.headphones),
                      SizedBox(height: 3,),
                      Text('contact us')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.favorite_outline),
                      SizedBox(height: 3,),
                      Text('following')
                    ],
                  ),   Column(
                    children: [
                      Icon(Icons.sell),
                      SizedBox(height: 3,),
                      Text('become a seller')
                    ],
                  ),   Column(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(height: 3,),
                      Text('settings')
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.only(left: 12, right: 12),
          //         height: 60,
          //         width: 200,
          //         color: Colors.white,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('wishlist'),
          //             Container(
          //               height: 40,
          //               width: 40,
          //               color: Colors.grey.withOpacity(0.2),
          //               child: IconButton(
          //                   onPressed: () {},
          //                   icon: Icon(Icons.favorite_outline)),
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         padding: EdgeInsets.only(left: 12, right: 12),
          //         height: 60,
          //         width: 200,
          //         color: Colors.white,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Recently Reviewed',
          //             ),
          //             Container(
          //               height: 40,
          //               width: 40,
          //               color: Colors.yellow,
          //               // recently reviewed image here
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
