// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:secondtask/models/cats/sub_cats_model.dart';
import 'package:secondtask/screens/cats/sub_sub_cats_prods.dart';
import 'package:secondtask/screens/seatch/search.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../models/cats/main_categories_model.dart';
import '../../utilites/methods.dart';
import '../home_screens/sub_cats_details.dart';

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
            child: SearchInput(shownText: ' عم تبحث؟ ',myContext: context,),
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
                    itemBuilder: (context, selected) => subCatCard(cubit.mainCategoriesModel!.data[selected], context, cubit)
                ),
                )],
            ),
          ),
        ],
      ),
    );});
  }
  Widget subCatCard(AllCatsModel allCatsModel,BuildContext context,HomeCubit cubit){
    return Column(
      children: [
        Row(
          children: [
            Text(allCatsModel.catNameAr.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),),
          ],
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:allCatsModel.subCats.length ,
            itemBuilder:(context,index)=>SubSubCatCard(subCats:allCatsModel.subCats[index], cubit: cubit) )
        ],
    );
  }
}





class SubSubCatCard extends StatelessWidget {
  const SubSubCatCard({Key? key,  required this.subCats, required this.cubit}) : super(key: key);
  final SubCats subCats;
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
                subCats.catNameAr.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20),
              ),
              InkWell(
                onTap: (){
                  cubit.get4SubSubCategories(subCats.id
                      .toString());
                  cubit.getScreenSubCatsProds(subCats.id.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCatsProds()));
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
              itemCount:subCats.subSubCats.length ,
              itemBuilder: (context, index) => Container(
                height: 200,
                width: 200,
                child: InkWell(
                  onTap: (){

                    print(subCats.subSubCats[index].id);
                    cubit.getSubSubCatsProds(subCats.subSubCats[index].id.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SubSubCatsProds()));

                  },
                  child: Column(
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),

                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                             child:
                             CachedNetworkImage(
                               errorWidget: (context, url, error) =>
                                   Icon(
                                     Icons.error,
                                     size: 60,
                                   ),
                               imageUrl:"https://alhasnaa.site/files/${subCats.subSubCats[index].catIcone}" ,

                               fit: BoxFit.cover,
                             ),

                          ),
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.white,
                          child: Text(subCats.subSubCats[index].catNameAr.toString()),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 5/7,
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
