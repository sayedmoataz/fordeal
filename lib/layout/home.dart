// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/home_cubit/home_cubit.dart';
import 'package:secondtask/home_cubit/home_states.dart';
import 'package:secondtask/screens/brands/brand.dart';
import 'package:secondtask/screens/cats/categories.dart';

import '../screens/account.dart';
import '../screens/cart.dart';
import '../screens/home.dart';
import '../screens/vendors/venders_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  static List<Widget> screens = <Widget>[
    Home(),
    Categories(),
    Brand(),
    Vendors(),
    Cart(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return cubit.userCartModel == null
              ? Scaffold(
                  body: Center(
                  child: CircularProgressIndicator(),
                ))
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    body: screens[cubit.selectedIndex],
                    bottomNavigationBar: BottomNavigationBar(
                      unselectedLabelStyle: TextStyle(color: Colors.grey[800]),
                      unselectedIconTheme:
                          IconThemeData(color: Colors.grey[800], size: 30),
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: cubit.selectedIndex == 0
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1,
                                          right: 8,
                                          left: 8),
                                      child: Text(
                                        'F',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w800),
                                      )),
                                )
                              : Icon(Icons.home_outlined),
                          label: 'الرئيسية',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              if (cubit.selectedIndex == 1)
                                Icon(
                                  Icons.circle,
                                  color: Colors.amber.withOpacity(.9),
                                  size: 21,
                                ),
                              Container(
                                height: 28,
                                  width: 28,
                                  child: Image.asset('assets/icons/category.png')),
                            ],
                          ),
                          label: 'الاقسام',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              if (cubit.selectedIndex == 2)
                                Icon(
                                  Icons.square,
                                  color: Colors.amber.withOpacity(.9),
                                  size: 21,
                                ),
                              Container(
                                  height: 32,
                                  width: 32,
                                  child: Image.asset('assets/icons/crown.png')),
                            ],
                          ),
                          label: 'الماركات',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              if (cubit.selectedIndex == 3)
                                Icon(
                                  Icons.shop,
                                  color: Colors.amber.withOpacity(.9),
                                  size: 21,
                                ),
                              Icon(Icons.shop_outlined),
                            ],
                          ),
                          label: 'البائعون',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  if (cubit.selectedIndex == 4)
                                    Icon(
                                      Icons.shopping_cart_rounded,
                                      color: Colors.amber.withOpacity(.9),
                                      size: 21,
                                    ),
                                  Icon(Icons.shopping_cart_outlined),
                                ],
                              ),
                              if (cubit.userCartModel!.data.isNotEmpty &&
                                  cubit.userCartModel != null)
                                CircleAvatar(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      cubit.userCartModel!.data.length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8.5),
                                    ),
                                  ),
                                  radius: 6.9,
                                  backgroundColor: Colors.red,
                                )
                            ],
                          ),
                          label: 'السلة',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              if (cubit.selectedIndex == 5)
                                Icon(
                                  Icons.person,
                                  color: Colors.amber.withOpacity(.9),
                                  size: 21,
                                ),
                              Icon(Icons.person_outlined),
                            ],
                          ),
                          label: 'حسابي',
                        ),
                      ],
                      currentIndex: cubit.selectedIndex,
                      selectedIconTheme: IconThemeData(size: 30),
                      selectedItemColor: Color.fromARGB(255, 0, 0, 0),
                      unselectedItemColor: Color.fromARGB(255, 131, 131, 131),
                      showUnselectedLabels: true,
                      onTap: (value) {
                        cubit.changeBottomNav(value);
                      },
                    ),
                  ),
                );
        });
  }
}
