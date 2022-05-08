
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../../local/cache_helper.dart';
import '../../utilites/methods.dart';
import '../cats/sub_sub_cats_prods.dart';
import '../details_page.dart';
import '../seatch/search.dart';

class SubCatsProds extends StatelessWidget {
  const SubCatsProds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
    builder: (context,state){
    var cubit =HomeCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body:cubit.screen4detailsProdsModel==null||cubit.subCats4ProdsModel==null?Center(child: CircularProgressIndicator(),): SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        children: [
                          SizedBox(height: 65,),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.subCats4ProdsModel!.data.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 10 / 15,
                                  crossAxisSpacing: 4,
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 4),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  cubit.getSubSubCatsProds(cubit.subCats4ProdsModel!.data[index].id.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubSubCatsProds()));








                                     },
                                child: Container(
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),

                                      child: Container(
                                        color: Colors.white,
                                        height:
                                        MediaQuery.of(context).size.width / 5,
                                        width:
                                        MediaQuery.of(context).size.width /5,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            errorWidget: (context, url, error) =>
                                                Icon(
                                                  Icons.error,
                                                  size: 60,
                                                ),
                                            imageUrl:
                                            'https://alhasnaa.site/files/${cubit.subCats4ProdsModel!.data[index].catIcone!}',
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(cubit
                                        .subCats4ProdsModel!.data[index].catNameAr!,maxLines: 2,),
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
                          MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(

                                crossAxisCount: 2),
                            mainAxisSpacing: 8,
                            crossAxisSpacing:8,
                            itemCount:cubit.screen4detailsProdsModel!.data.length ,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                                  itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                cubit.getSingleProduct(cubit
                                    .screen4detailsProdsModel!
                                    .data[index]
                                    .prodId
                                    .toString());
                                await cubit.checkProdInFavorite( cubit.screen4detailsProdsModel!
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
                                        child: Image.network('https://alhasnaa.site/files/${cubit.screen4detailsProdsModel!.data[index].prodImg}'
                                          ,
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
                                        cubit.screen4detailsProdsModel!.data[index].prodNameAr.toString(),
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,                    ),
                                    ),
                                    // if there is a deal show this text
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                          (int.parse( cubit.screen4detailsProdsModel!
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
          ),
        );});
  }
}
