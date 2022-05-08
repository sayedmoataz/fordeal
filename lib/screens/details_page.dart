// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secondtask/screens/seatch/search_tf.dart';

import '../home_cubit/home_cubit.dart';
import '../home_cubit/home_states.dart';
import '../local/cache_helper.dart';
import 'my_methods.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return   BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:cubit.singleProductModel==null?Center(
          child: CircularProgressIndicator(),): Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.5,
                    width: double.infinity,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.singleProductModel!.images.length,
                      itemBuilder: (context, index) => Stack(
                        children: [
                          Container(
                            height: height * 0.5,
                            width: double.infinity,
                            child: CachedNetworkImage(
                          errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 60,
                    ),
                imageUrl:
                'https://alhasnaa.site/files/${cubit.singleProductModel!.images[index]}',                fit: BoxFit.cover,
              ),

                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text('${index+1}/${cubit.singleProductModel!.images.length}'),
                                // change the 8 with the list.length
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((int.parse( cubit.singleProductModel!.prodPrice!*(int.parse(CacheHelper.getData(key: 'currencyPrice')))).toString()+'   '+CacheHelper.getData(key: 'currency')),

                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       // change the 7 with the number of units sold
                        //       cubit.singleProductModel!.prodSort.toString(),
                        //       style: TextStyle(
                        //           color: Colors.amber,
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14),
                        //     ),
                        //     Text(
                        //       ' Sold/month',
                        //       style: TextStyle(fontSize: 14),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Text(
                          // change the next text with the old price of thhe product
                          cubit.singleProductModel!.prodPriceOld.toString(),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        // Text(
                        //   '(VAT inclusive)',
                        //   style: TextStyle(fontSize: 14),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12, top: 12),
                    child: Container(
                      child: Text(
                        cubit.singleProductModel!.prodNameAr!,
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8), fontSize: 14),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 60,
                      width: 300,
                      color: Colors.blue.withOpacity(0.4),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.yellow),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sold well by ${cubit.singleProductModel!.brandNameAr}',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // Text(
                                //   cubit.singleProductModel!.br,
                                //   style: TextStyle(
                                //     fontSize: 10,
                                //     color: Colors.blue,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(12),
                  //   child: Text('Style:'),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(12),
                  //   child: Container(
                  //     padding: EdgeInsets.all(4),
                  //     height: height * 0.2,
                  //     color: Colors.yellow,
                  //     child: GridView.builder(
                  //       itemCount: 7,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisSpacing: 8,
                  //           crossAxisCount: 5,
                  //           mainAxisSpacing: 8),
                  //       itemBuilder: (context, index) => Container(
                  //         // child: Image.asset(""),
                  //         // add the image here
                  //         decoration: BoxDecoration(color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المقاس'),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => SizePage()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("ما هو مقاسي"),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      height: height * 0.16,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cubit.singleProductModel!.size.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            crossAxisCount: 6,
                            mainAxisSpacing: 8),
                        itemBuilder: (context, index) => Container(
                          height: 30,
                          width: 40,
                          child: Center(
                            child: Text(cubit.singleProductModel!.size[index]),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 4,
                    width: double.maxFinite,
                    color: Colors.grey,
                  ),
                  CustomRow(
                    rowTitle: 'المواصفات',
                  ),
                  CustomRow(
                    rowTitle: 'سياسة الخصوصية',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        IconRow(
                          text: 'اعادة خلال 15 يوم',
                          icon: Icons.calculate,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        IconRow(
                          text: 'الدفع عند الاستلام',
                          icon: Icons.money,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 4,
                  //   width: double.maxFinite,
                  //   color: Colors.grey,
                  // ),
                  // CustomRow(
                  //   rowTitle: 'Ship from Overseas',
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 12, bottom: 12),
                  //   child: Text(
                  //     'Estimated Time of Arrival:',
                  //     // add the time here
                  //     style: TextStyle(color: Colors.greenAccent),
                  //   ),
                  // ),
                  // Container(
                  //   height: 4,
                  //   width: double.maxFinite,
                  //   color: Colors.grey,
                  // ),
                  // CustomRow(
                  //   rowTitle: 'Reviews ()',
                  //   //add the review number here
                  // ),
                  // Container(
                  //   height: 4,
                  //   width: double.maxFinite,
                  //   color: Colors.grey,
                  // ),
                  // CustomRow(
                  //   rowTitle: 'All Reviews of the shop ()',
                  //   //add the review number here
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.blue.withOpacity(0.4),
                  //         borderRadius: BorderRadius.circular(4)),
                  //     height: 30,
                  //     width: double.maxFinite,
                  //     child: Center(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           Icon(Icons.face_outlined),
                  //           Expanded(
                  //             child: Text(
                  //               'Well-reviewed shop. moderate level compared with other shops',
                  //               style: TextStyle(fontSize: 11),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(12),
                  //     height: height * 0.2,
                  //     width: double.maxFinite,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey.withOpacity(0.1),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Column(
                  //       children: [
                  //         ChartsCard(
                  //             chartName: 'Worth Buying',
                  //             percentage: 87,
                  //             boldIsTrue: true),
                  //         ChartsCard(
                  //             chartName: 'High Quality',
                  //             percentage: 80,
                  //             boldIsTrue: false),
                  //         ChartsCard(
                  //             chartName: 'Moderate size',
                  //             percentage: 77,
                  //             boldIsTrue: false),
                  //         ChartsCard(
                  //             chartName: 'Description match',
                  //             percentage: 82,
                  //             boldIsTrue: false),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // CustomBrandRow(rowTitle: 'FH'),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: 38,
                  //       width: 150,
                  //       child: Center(child: Text('all')),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.amber),
                  //           borderRadius: BorderRadius.circular(16),
                  //           color: Colors.white),
                  //     ),
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Container(
                  //       height: 38,
                  //       width: 150,
                  //       child: Center(child: Text('New in')),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.amber),
                  //           borderRadius: BorderRadius.circular(16),
                  //           color: Colors.white),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // Container(
                  //   height: height * 0.1,
                  //   width: double.maxFinite,
                  //   color: Colors.grey.withOpacity(0.1),
                  //   child: Center(
                  //     child: Text('Item Description'),
                  //   ),
                  // ),
                  SizedBox(
                    height: height * 0.25 * 6,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:cubit.singleProductModel!.images.length,
                      itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          color: Colors.yellow,
                          child: Image.network(
                            'https://alhasnaa.site/files/${cubit.singleProductModel!.images[index]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                width: double.maxFinite,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomIcons(
                      color: Colors.black.withOpacity(0.8),
                      iconName: 'المتجر',
                      icona: Icons.shop_2_outlined,
                    ),
                    BottomIcons(
                      color: Colors.black.withOpacity(0.8),

                      iconName: 'العربة',
                      icona: Icons.shopping_cart_rounded,
                    ),
                    InkWell(
                      onTap: (){if(CacheHelper.getData(key: 'uid')==null){
                        Fluttertoast.showToast(msg: 'عليك تسجيل الدخول اولا');
                      }else{
                        if(cubit.checkProdFavResult==true){
                          cubit
                              .deleteFromFavourites(
                              cubit.singleProductModel!
                                  .id.toString())
                              .then((value) {
                            cubit
                                .getFavourites();
                          });
                          cubit.checkProdInFavorite(cubit.singleProductModel!.id.toString());

                          // cubit.deleteFromFavourites(cubit.favouritesModel!.data[index].id!).then((value) {
                          // cubit.getFavourites();});
                        }else{
                          cubit.addToFavourites(cubit.singleProductModel!.id.toString()).then((value){
                            cubit.getFavourites().then((value) {
                              cubit.checkProdInFavorite(cubit.singleProductModel!.id.toString());
                            });

                          });
                        }
                      }


                      },
                      child: BottomIcons(
                          color:cubit.checkProdFavResult!?Colors.amber: Colors.black.withOpacity(0.8),

                          iconName:cubit.checkProdFavResult!?'تم الحفظ': 'حفظ', icona:cubit.checkProdFavResult!?Icons.favorite: Icons.favorite_outline),
                    ),
                    InkWell(
                      onTap: (){
    if(CacheHelper.getData(key: 'uid')==null){
    Fluttertoast.showToast(msg: 'عليك تسجيل الدخول اولا');
    }else{  cubit.addFirstToCart(cubit.singleProductModel!.id.toString()).then((value) {
      cubit.getUserCart();
    });}


                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        height: 40,
                        width: 200,
                        child: Center(
                          child: Text('اضافة الي العربة'),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(height * 0.05)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading:      IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title:  InkWell(
            onTap: () async {
      Navigator.push(context, MaterialPageRoute(builder: (myContext)=>SearchTF()));
      },
        child: Container(
          height: 35,
          width: double.infinity,
          decoration:
          BoxDecoration(
              border: Border.all(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white),
          child: Row(
            children: [
              Icon(Icons.search,color: Colors.grey,),
              Text('بحث',style: TextStyle(color: Colors.grey),),
              Spacer(),
              Container(
                child: Center(child: Text('   بحث  ',style: TextStyle(color: Colors.white),)),
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)
                ),
              )],
          ),
        ),
      ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.abc,
                size: 30,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.abc,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );});
  }
}






class BottomIcons extends StatelessWidget {
  const BottomIcons({Key? key, required this.iconName, required this.icona, required this.color})
      : super(key: key);
  final String iconName;
  final IconData icona;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icona,
          color: color,
        ),
        // SizedBox(
        //   height: 5,
        // ),
        Text(iconName),
      ],
    );
  }
}


