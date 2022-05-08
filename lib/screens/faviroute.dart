// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/layout/home.dart';

import '../home_cubit/home_cubit.dart';
import '../home_cubit/home_states.dart';
import '../local/cache_helper.dart';
import 'auth_screens/login_page.dart';
import 'details_page.dart';

class Faviroute extends StatelessWidget {
  const Faviroute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('قائمة المفضلات'),
        ),
        body: CacheHelper.getData(key: 'uid') == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    height: 200,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 60,
                    ),
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.rHOZmq6SX1aIeZrs8nU1MwAAAA?pid=ImgDet&rs=1',
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'عليك تسجيل الدخول لاستخدام المفضلة',
                          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                            // navigate to the home screen
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              ' تسجيل الدخول',
                              style: TextStyle(color: Colors.amber),
                            )),
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.amber),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return cubit.favouriteOpenStatus.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : InkWell(
                  onTap: () {
                    if (cubit.favouriteOpenStatus.contains(true)) {
                      cubit.changeFavCardStatusState(false, 0);
                    }
                  },
                  child: SingleChildScrollView(
                    child: cubit.favouritesModel!.data.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  size: 60,
                                ),
                                imageUrl:
                                    'https://th.bing.com/th/id/OIP.rHOZmq6SX1aIeZrs8nU1MwAAAA?pid=ImgDet&rs=1',
                                height: 200,
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                              Container(
                                width: double.maxFinite,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'قائمة المفضلة فارغة',
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        // navigate to the home screen
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          'اذهب للتسوق',
                                          style: TextStyle(color: Colors.amber),
                                        )),
                                        height: 40,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                                Border.all(color: Colors.amber),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : GridView.builder(
                            itemCount: cubit.favouritesModel!.data.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 6 / 11,
                                    crossAxisSpacing: 4,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 4),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                if (cubit.favouriteOpenStatus.contains(true)) {
                                  cubit.changeFavCardStatusState(false, 0);
                                } else {
                                  cubit.getSingleProduct(cubit
                                      .favouritesModel!.data[index].prodId
                                      .toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage()));
                                }
                              },
                              child: Container(
                                color: Colors.white,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Container(

                                      color: Colors.white,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            CachedNetworkImage(
                                              height: 150,

                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Icon(
                                                  Icons.error,
                                                  size: 60,
                                                ),
                                              ),
                                              imageUrl:
                                                  'https://alhasnaa.site/files/${cubit.favouritesModel!.data[index].prodImg!}',
                                              fit: BoxFit.cover,
                                            ),
                                            if (cubit
                                                .favouriteOpenStatus[index])
                                              Container(
                                                height: 150,

                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(

                                                        child: Center(
                                                            child: Text(
                                                          '  منتجات ذات صلة  ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        height: 40,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          cubit
                                                              .deleteFromFavourites(
                                                                  cubit
                                                                      .favouritesModel!
                                                                      .data[
                                                                          index]
                                                                      .prodId!)
                                                              .then((value) {
                                                            cubit
                                                                .getFavourites();
                                                          });
                                                        },
                                                        child: Container(
                                                          child: Center(
                                                              child: Text(
                                                            '  حذف  ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          height: 40,
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                              )
                                          ],
                                        ),
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
                                        cubit.favouritesModel!.data[index]
                                            .prodNameAr!,
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // if there is a deal show this text
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              int.parse(cubit
                                                              .favouritesModel!
                                                              .data[index]
                                                              .prodPrice! *
                                                          (int.parse(CacheHelper
                                                              .getData(
                                                                  key:
                                                                      'currencyPrice'))))
                                                      .toString() +
                                                  '   ' +
                                                  CacheHelper.getData(
                                                      key: 'currency'),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                cubit.changeFavCardStatusState(
                                                    true, index);
                                              },
                                              icon: Icon(Icons.more_horiz)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                );
        });
  }
}
