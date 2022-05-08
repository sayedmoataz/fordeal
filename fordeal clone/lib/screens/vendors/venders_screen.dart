// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/screens/vendors/vendor_prods.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../utilites/methods.dart';
import '../seatch/search.dart';

class Vendors extends StatelessWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'البائعون',
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
            ),
            body: ListView.builder(
                itemCount: cubit.allBrands!.data.length,
                itemBuilder: (context,index)=>InkWell(
                    onTap: (){
                      cubit.getVendorProducts(cubit.vendorsModel!.data[index].vendorId.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendorProds()));

                                         },
                    child: VendorsCard(image:'https://alhasnaa.site/files/${cubit.vendorsModel!.data[index].logo}',name:cubit.vendorsModel!.data[index].vendorName! ,offer:cubit.vendorsModel!.data[index].mText! ))),
          );});
  }
}

class VendorsCard extends StatelessWidget {
  const VendorsCard({Key? key, required this.image, required this.name, required this.offer}) : super(key: key);
  final String image;
  final String name;
  final String offer;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: height * 0.38,
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        children: [
          SizedBox(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
            height: height * 0.28,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12, right: 12, left: 12),
              color: Colors.white,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    offer,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


