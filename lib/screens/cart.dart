// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/layout/home.dart';
import 'package:secondtask/models/cart_models/cart_model.dart';
import 'package:secondtask/screens/auth_screens/login_page.dart';

import '../home_cubit/home_cubit.dart';
import '../home_cubit/home_states.dart';
import '../local/cache_helper.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.black,
                    ),
                    Text(
                      'اختار عنوان التوصيل',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 14,
                      color: Colors.black,
                    ),
                  ],
                )),
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
                              'عليك تسجيل الدخول لاستخدام العربة',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
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
                : cubit.userCartModel == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.userCartModel!.data.isEmpty
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
                                      'عربتك فارغة',
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cubit.goShopping();

                                        // navigate to the home screen
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          'تسوق الان',
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
                        : ListView.builder(
                            itemCount: cubit.userCartModel!.data.length,
                            itemBuilder: (context, index) => CartItem(
                                  cubit: cubit,
                                  model: cubit.userCartModel!.data[index],
                                  index: index,
                                )),
          );
        });
  }
}

class CartItem extends StatefulWidget {
  const CartItem(
      {Key? key, required this.cubit, required this.model, required this.index})
      : super(key: key);
  final HomeCubit cubit;
  final UserCartDataModel model;
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.2,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: height * 0.2,
                width: double.maxFinite,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.amber,
                    )),

                // add a radio button
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                height: height * 0.29,
                width: double.maxFinite,
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 60,
                  ),
                  imageUrl:
                      "https://alhasnaa.site/files/${widget.model.prodImg}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(8),
                height: height * 0.2,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.model.prodNameAr.toString()),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          height: 25,
                          width: 70,
                          child: GestureDetector(
                            onTap: () {},
                            // navigator.push to the address pick page
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'size',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 14,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (int.parse(widget.model.prodPrice! *
                                      (int.parse(CacheHelper.getData(
                                          key: 'currencyPrice'))))
                                  .toString() +
                              '   ' +
                              CacheHelper.getData(key: 'currency')),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.cubit
                                    .deleteFromCart(widget.model.id!,(int.parse(widget.cubit.userCartModel!
                                    .data[widget.index].prodNo
                                    .toString())-1).toString()  ,widget.model.prodPrice!)
                                    .then((value) {
                                  widget.cubit.getUserCart();
                                });
                              },
                              child: Icon(
                                (int.parse(widget.model.prodNo!)) > 1
                                    ? Icons.remove
                                    : Icons.delete_outlined,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              color: Colors.grey.withOpacity(0.5),
                              height: 20,
                              width: 40,
                              child: Center(
                                child: Text(widget.model.prodNo.toString()),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                widget.cubit
                                    .addToCart( widget.cubit.userCartModel!
                                    .data[widget.index].id
                                    .toString(),(int.parse(widget.cubit.userCartModel!
                                    .data[widget.index].prodNo
                                    .toString())+1).toString()  ,  widget.cubit.userCartModel!
                                    .data[widget.index].prodPrice
                                    .toString())
                                    .then((value) {
                                  widget.cubit.getUserCart();
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
