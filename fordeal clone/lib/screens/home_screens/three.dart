import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../details_page.dart';
import '../seatch/search.dart';

class ThreeHome extends StatelessWidget {
  const ThreeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);

          return cubit.countryMainCategoryProductsModel3==null?Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '""',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '""',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.sub8catModel3!.data.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 10/13,
                        crossAxisSpacing: 4, crossAxisCount: 4, mainAxisSpacing: 4),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        cubit.search( cubit.sub8catModel3!.data[index].catNameAr.toString());
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchData(searchData: cubit.sub8catModel3!.data[index].catNameAr.toString())) );
                      },
                      child: GestureDetector(
                        // onTap: () => Navigator.pushNamed(context, routeName),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Column(children: [
                            Container(

                              height: MediaQuery.of(context).size.width/5.2,
                              width: MediaQuery.of(context).size.width/5.4,                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network('https://alhasnaa.site/files/${cubit.sub8catModel3!.data[index].catImg!}'
                                  ,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(cubit.sub8catModel3!.data[index].catNameAr!),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 8),
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
                GridView.builder(

                  itemCount:cubit.countryMainCategoryProductsModel3!.data.length ,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3/4,

                      crossAxisSpacing: 4, crossAxisCount: 2, mainAxisSpacing: 4),
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      cubit.getSingleProduct(cubit.countryMainCategoryProductsModel3!.data[index].prodId.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            width:double.infinity ,
                            height: MediaQuery.of(context).size.width/2.35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)
                              ),
                              child: Image.network('https://alhasnaa.site/files/${ cubit.countryMainCategoryProductsModel3!.data[index].prodImg!}'
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
                              cubit.countryMainCategoryProductsModel3!.data[index].prodNameAr!,
                              style: TextStyle(color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,                    ),
                          ),
                          // if there is a deal show this text
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              cubit.countryMainCategoryProductsModel3!.data[index].prodPrice!,
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
          );});
  }
}