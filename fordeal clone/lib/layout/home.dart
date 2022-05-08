import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/home_cubit/home_cubit.dart';
import 'package:secondtask/home_cubit/home_states.dart';
import 'package:secondtask/screens/brand.dart';
import 'package:secondtask/screens/categories.dart';

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
    return BlocConsumer<HomeCubit,HomeStates>(
        listener:(context,state){},
      builder:(context,state){
          var cubit =HomeCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body:screens[cubit.selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedLabelStyle:TextStyle(
                  color:  Colors.grey
                ) ,
                selectedIconTheme: IconThemeData(
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                        color: Colors.amber,blurRadius: 1,offset: Offset(2, 4)),
                  ]

                ),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: 'الاقسام',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bolt_outlined),
                    label: 'الماركات',
                  ),BottomNavigationBarItem(
                    icon: Icon(Icons.shop_outlined),
                    label: 'البائعون',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'السلة',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'حسابي',
                  ),
                ],
                currentIndex: cubit.selectedIndex,
                selectedItemColor: Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Color.fromARGB(255, 131, 131, 131),
                showUnselectedLabels: true,
                onTap: (value){
                  cubit.changeBottomNav(value);
                },
              ),
            ),
          );

    }

    );
  }
}