
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../local/cache_helper.dart';
import '../../utilites/methods.dart';
import '../details_page.dart';
import '../seatch/search.dart';

class SubSubCatsProds extends StatelessWidget {
  const SubSubCatsProds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body:cubit.homeSubSubCatProdsModel==null?Center(child: CircularProgressIndicator(),): SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(

                                crossAxisCount: 2),
                            mainAxisSpacing: 8,
                            crossAxisSpacing:8,
                            itemCount:cubit.homeSubSubCatProdsModel!.data.length ,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                              onTap: () async {

                                cubit.getSingleProduct(cubit
                                    .homeSubSubCatProdsModel!
                                    .data[index]
                                    .prodId
                                    .toString());
                                await cubit.checkProdInFavorite( cubit.homeSubSubCatProdsModel!
                                    .data[index]
                                    .prodId
                                    .toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage()));





                              },
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(

                                      width:double.infinity ,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)
                                        ),
                                        child:
                                        CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                                Icons.error,
                                                size: 60,
                                              ),
                                          imageUrl:'https://alhasnaa.site/files/${cubit.homeSubSubCatProdsModel!.data[index].prodImg}' ,

                                          fit: BoxFit.cover,
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
                                        cubit.homeSubSubCatProdsModel!.data[index].prodNameAr.toString(),
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,                    ),
                                    ),
                                    // if there is a deal show this text
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        (int.parse( cubit.homeSubSubCatProdsModel!
                                            .data[index].prodPrice!*(int.parse(CacheHelper.getData(key: 'currencyPrice')))).toString()+'   '+CacheHelper.getData(key: 'currency')),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios_outlined)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SearchInput(shownText: 'عم تبحث ؟ ', myContext: context),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );});
  }
}
