// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:secondtask/screens/details_page.dart';
import 'package:secondtask/screens/home_screens/sub_cats_details.dart';
import 'package:secondtask/screens/seatch/search.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../local/cache_helper.dart';

class HomeOne extends StatelessWidget {
  const HomeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return (cubit.countryMainCategoryProductsModel1 == null || cubit.sub8catModel1==null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(backgroundColor: Colors.grey[100],
                body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text('توصيل مجاني',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                        ),), Text('الطلب باكثر من 200 ريال',style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12
                                        ),),
                                      ],
                                    ),  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text('خدمة ارجاع',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                        ),), Text('في غضون 15 يوم',style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12
                                        ),),
                                      ],
                                    ),  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text('الدفع عند الاستلام',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                        ),), Text('',style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)

                              ),
                              height: 70,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.sub8catModel1!.data.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 10 / 14,
                                  crossAxisSpacing: 4,
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 4),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  cubit.getScreenSubCatsProds(cubit
                                      .sub8catModel1!.data[index].id
                                      .toString());
                                  cubit.get4SubSubCategories(cubit
                                      .sub8catModel1!.data[index].id
                                      .toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubCatsProds()));
                                },
                                child: GestureDetector(
                                  // onTap: () => Navigator.pushNamed(context, routeName),
                                  child: Container(
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(10)),
                                    child: Column(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),

                                        child: Container(
                                          color: Colors.white,
                                          height:
                                          MediaQuery.of(context).size.width / 6.2,
                                          width:
                                          MediaQuery.of(context).size.width /6.2,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: CachedNetworkImage(
                                              errorWidget: (context, url, error) =>
                                                  Icon(
                                                    Icons.error,
                                                    size: 60,
                                                  ),
                                              imageUrl:
                                              'https://alhasnaa.site/files/${cubit.sub8catModel1!.data[index].catIcone!}',
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(cubit
                                          .sub8catModel1!.data[index].catNameAr!,maxLines: 2,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 8),
                                        // child: Container(
                                        //   height: 18,
                                        //   width: double.maxFinite,
                                        //   decoration: BoxDecoration(
                                        //     color: Colors.amber,
                                        //     borderRadius: BorderRadius.circular(12),
                                        //   ),
                                        //   child: Center(
                                        //       child: Padding(
                                        //         padding: const EdgeInsets.only(left: 6),
                                        //         child: Text(
                                        //           cubit.sub8catModel!.data[index].catTextAr!,
                                        //           style: TextStyle(color: Colors.white),
                                        //         ),
                                        //       )),
                                        // ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 6),
                          //   child: GridView.builder(
                          //     shrinkWrap: true,
                          //     physics: NeverScrollableScrollPhysics(),
                          //     itemCount: cubit.sub8catModel1!.data.length,
                          //     gridDelegate:
                          //         SliverGridDelegateWithFixedCrossAxisCount(
                          //             childAspectRatio: 10 / 13,
                          //             crossAxisSpacing: 4,
                          //             crossAxisCount: 4,
                          //             mainAxisSpacing: 4),
                          //     itemBuilder: (context, index) => InkWell(
                          //       onTap: () {
                          //         cubit.getScreenSubCatsProds(cubit
                          //             .sub8catModel1!.data[index].id
                          //             .toString());
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => SubCatsProds()));
                          //
                          //       },
                          //       child: GestureDetector(
                          //         // onTap: () => Navigator.pushNamed(context, routeName),
                          //         child:
                          //
                          //
                          //         Container(
                          //           decoration: BoxDecoration(
                          //             color: Colors.white,
                          //               borderRadius: BorderRadius.circular(10)),
                          //           child: Column(children: [
                          //             Expanded(
                          //               child: ClipRRect(
                          //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          //                 child: CachedNetworkImage(
                          //                   errorWidget: (context, url, error) =>
                          //                       Icon(
                          //                         Icons.error,
                          //                         size: 60,
                          //                       ),
                          //                   imageUrl:  'https://alhasnaa.site/files/${cubit.sub8catModel1!.data[index].catIcone!}',
                          //                   width: double.infinity,
                          //                 ),
                          //
                          //
                          //               ),
                          //             ),
                          //             Text(cubit
                          //                 .sub8catModel1!.data[index].catNameAr!),
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10, top: 8),
                          //               child: Container(
                          //                 height: 18,
                          //                 width: double.maxFinite,
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.orange,
                          //                   borderRadius: BorderRadius.circular(12),
                          //                 ),
                          //                 child: Center(
                          //                     child: Padding(
                          //                       padding: const EdgeInsets.only(left: 6),
                          //                       child: Text(
                          //                         cubit.sub8catModel1!.data[index].catTextAr!,
                          //                         style: TextStyle(color: Colors.white),
                          //                       ),
                          //                     )),
                          //               ),
                          //             )
                          //           ]),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(

                                crossAxisCount: 2),
                            mainAxisSpacing: 8,
                            crossAxisSpacing:8,


                            itemCount: cubit
                                .countryMainCategoryProductsModel1!.data.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,

                            itemBuilder: (context, index) =>
                                InkWell(
                                  onTap: () async {
                                    // cubit.deleteGridItem(cubit.countryMainCategoryProductsModel1!.data,index);
                                    cubit.getSingleProduct(cubit
                                        .countryMainCategoryProductsModel1!
                                        .data[index]
                                        .prodId
                                        .toString());
                                    cubit.getSimilarProduct(cubit
                                        .countryMainCategoryProductsModel1!
                                        .data[index]
                                        .prodId
                                        .toString());
                                    await cubit.checkProdInFavorite( cubit.countryMainCategoryProductsModel1!
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
                                          CachedNetworkImage(
                                            width: double.infinity,

                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,str,dP)=>Padding(
                                              padding: const EdgeInsets.all(50.0),
                                              child: CircularProgressIndicator(),
                                            ),

                                            errorWidget: (context, url, error) =>
                                                Icon(
                                                  Icons.error,
                                                  size: 60,
                                                ),
                                            imageUrl:'https://alhasnaa.site/files/${cubit.countryMainCategoryProductsModel1!.data[index].prodImg!}',

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
                                              cubit.countryMainCategoryProductsModel1!
                                                  .data[index].prodNameAr!,
                                              style: TextStyle(color: Colors.black),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // if there is a deal show this text
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text((int.parse( cubit.countryMainCategoryProductsModel1!
                                                .data[index].prodPrice!*(int.parse(CacheHelper.getData(key: 'currencyPrice')))).toString()+'   '+CacheHelper.getData(key: 'currency'))
                                             ,
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
                    ),
                  ),
              );
        });
  }
}
