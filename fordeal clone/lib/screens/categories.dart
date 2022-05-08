// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:secondtask/models/cats/sub_cats_model.dart';
import 'package:secondtask/screens/seatch/search.dart';

import '../home_cubit/home_cubit.dart';
import '../home_cubit/home_states.dart';
import '../models/cats/main_categories_model.dart';
import '../utilites/methods.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);
      return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchInput(shownText: 'What are you looking for ',myContext: context,),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: height * 0.8,
                  width: width * 0.3,
                  color: Colors.grey.withOpacity(0.2),
                  child: ListView.builder(
                    itemCount: cubit.mainCategoriesModel!.data.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        cubit.changeCat(index);

                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        color: index == cubit.selectedCatsIndex
                            ? Colors.white
                            : Colors.grey.withOpacity(0.2),
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 15),
                            child: Text(cubit.mainCategoriesModel!.data[index].catNameAr.toString())),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: height * 0.8,
                  width: width * 0.7,
                  child: ScrollablePositionedList.builder(
                    physics: BouncingScrollPhysics(),
                    itemScrollController: cubit.itemScrollController,
                    itemPositionsListener: cubit.itemPositionsListener,
                    itemCount: cubit.mainCategoriesModel!.data.length,
                    itemBuilder: (context, selected) => SubCatCard(
                      allCatsModel: cubit.mainCategoriesModel!.data[selected],
                      cubit: cubit,
                  ),
                ),
                )],
            ),
          ),
        ],
      ),
    );});
  }
}

class SubCatCard extends StatelessWidget {
  const SubCatCard({Key? key,  required this.allCatsModel, required this.cubit}) : super(key: key);
  final AllCatsModel allCatsModel;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                allCatsModel.catNameAr.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              InkWell(
                onTap: (){
                  cubit.search(allCatsModel.catNameAr.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchData(searchData: allCatsModel.catNameAr.toString())));
                },

                child: Row(
                  children: [
                    Text(
                      'all',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(12),
            width: double.maxFinite,
            color: Colors.white,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:allCatsModel.subCats.length ,
              itemBuilder: (context, index) => Container(
                height: 200,
                width: 200,
                child: InkWell(
                  onTap: (){
                    cubit.search(allCatsModel.subCats[index].catNameAr.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchData(searchData: allCatsModel.subCats[index].catNameAr.toString())));

                  },
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.white,
                           child: Image.network("https://alhasnaa.site/files/${allCatsModel.subCats[index].catImg}",fit: BoxFit.cover,),
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.white,
                          child: Text(allCatsModel.subCats[index].catNameAr.toString()),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8, crossAxisCount: 3, mainAxisSpacing: 8),
            ),
          ),
        ],
      ),
    );
  }
}

// class ProductCard extends StatelessWidget {
//   const ProductCard(
//       {Key? key, required this.subCatImage, required this.subCatName})
//       : super(key: key);
//   final String subCatImage;
//   final String subCatName;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 8),
//       color: Colors.grey,
//       height: 140,
//       width: 140,
//       child: Column(children: [
//         Image.asset(
//           subCatImage,
//           fit: BoxFit.cover,
//           height: 100,
//         ),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(subCatName),
//           ),
//         )
//       ]),
//     );
//   }
// }
