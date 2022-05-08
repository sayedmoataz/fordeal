import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:secondtask/screens/settings/app_settings.dart';
import 'package:secondtask/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:secondtask/screens/faviroute.dart';

import '../home_cubit/home_cubit.dart';
import '../home_cubit/home_states.dart';
import '../local/cache_helper.dart';
import '../utilites/methods.dart';
import 'auth_screens/login_page.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return  BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
         var cubit =HomeCubit.get(context);
          return Scaffold(
      backgroundColor: Colors.grey[100],
      body:cubit.recomProductsModel==null?Center(child:CircularProgressIndicator(),): SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 0.2,
              width: double.maxFinite,
              color: Colors.yellow[600],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(height: height*0.07,),
                  Row(
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
                          ),if(CacheHelper.getData(key: 'uid')==null)
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
                      IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined,size: 35,))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: Colors.black.withOpacity(0.8),
                                iconName: 'قيد التاكيد',
                                icona: Icons.shop_2_outlined,
                              ),
                              BottomIcons2(
                                color: Colors.black.withOpacity(0.8),
                                iconName: 'قيد التجهيز',
                                icona: 'assets/icons/package.png',
                              ),
                              BottomIcons2(
                                color: Colors.black.withOpacity(0.8),
                                iconName: 'تم الشحن',
                                icona: 'assets/icons/delivery-van.png',
                              ),
                              BottomIcons2(
                                color: Colors.black.withOpacity(0.8),
                                iconName: 'تقييم',
                                icona: 'assets/icons/edit.png',
                              ),
                              // BottomIcons(
                              //   color: Colors.black.withOpacity(0.8),
                              //   iconName: 'Return',
                              //   icona: Icons.arrow_circle_down_outlined,
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        width: double.maxFinite,
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  settingsItem(
                                      onTap: () {},
                                      title: "المحفظة",
                                      icon: Icons.wallet),
settingsItem(
                                      onTap: () {},
                                      title: "كوبون",
                                      icon: Icons.star),

                                  settingsItem(
                                      onTap: () {},
                                      title: "العنوان",
                                      icon: Icons.location_on_outlined),
                                  settingsItem(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AppSettings()));
                                      },
                                      title: "اتصل بنا",
                                      icon: Icons.headphones),
                                ],
                              ), Row(
                                children: [
                                  settingsItem(
                                      onTap: () {},
                                      title: "تتابعه",
                                      icon: Icons.home_outlined),

                                  // settingsItem(
                                  //     onTap: () {},
                                  //     title: "become a seller",
                                  //     icon: Icons.sell),
                                  settingsItem(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AppSettings()));
                                      },
                                      title: "اعدادات",
                                      icon: Icons.settings_outlined),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            height: 60,
                            width: 200,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Faviroute()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('المفضلة'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey.withOpacity(0.2),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_outline)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            height: 60,
                            width: 200,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recently Viewed',
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey.withOpacity(0.2),
                                  //add the recent pic
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Stack(
                    alignment: Alignment.centerRight,

                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 7,
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.yellow,
                            radius: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('الموصى به',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  MasonryGridView.builder(
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount: 2),
                    mainAxisSpacing: 8,
                    crossAxisSpacing:8,
                    itemCount:cubit.recomProductsModel!.data.length ,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                      onTap: () async {

                        cubit.getSingleProduct(cubit
                            .recomProductsModel!
                            .data[index]
                            .prodId
                            .toString());
                        await cubit.checkProdInFavorite( cubit.recomProductsModel!
                            .data[index]
                            .prodId
                            .toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage()));





                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                width:double.infinity ,
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Icon(
                                        Icons.error,
                                        size: 60,
                                      ),
                                  imageUrl:'https://alhasnaa.site/files/${cubit.recomProductsModel!.data[index].prodImg}' ,

                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4),
                              //   child: Text(
                              //     'data',
                              //     style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  cubit.recomProductsModel!.data[index].prodNameAr.toString(),
                                  style: TextStyle(color: Colors.black),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,                    ),
                              ),
                              // if there is a deal show this text
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  (int.parse( cubit.recomProductsModel!
                                      .data[index].prodPrice!*(int.parse(CacheHelper.getData(key: 'currencyPrice')))).toString()+'   '+CacheHelper.getData(key: 'currency')),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );});
  }
}


class settingsItem extends StatelessWidget {
  const settingsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon),
            SizedBox(
              height: 3,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
