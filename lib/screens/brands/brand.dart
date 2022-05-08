// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/screens/brands/brands_prods.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../utilites/methods.dart';
import '../seatch/search.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

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
          'الماركات',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: cubit.allBrands!.data.length,
          itemBuilder: (context,index)=>InkWell(
              onTap: (){
                cubit.getBrandProducts( cubit.allBrands!.data[index].id.toString());
                Navigator.push(context,MaterialPageRoute(builder: (context)=>BrandProds()) );
              },
              child: BrandCard(image:'https://alhasnaa.site/files/${cubit.allBrands!.data[index].catImg}',name:cubit.allBrands!.data[index].catNameAr! ,offer:cubit.allBrands!.data[index].catTextAr! ))),
    );});
  }
}


