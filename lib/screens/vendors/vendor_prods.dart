import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/screens/details_page.dart';
import 'package:secondtask/screens/seatch/search.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';

class VendorProds extends StatelessWidget {
  const VendorProds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);

          return
          Scaffold(
            body:cubit.vendorProductsModel==null?Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
                children: [

                  GridView.builder(
                    itemCount:cubit.vendorProductsModel!.data.length ,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3/4,
                        crossAxisSpacing: 4, crossAxisCount: 2, mainAxisSpacing: 4),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        cubit.getSingleProduct(cubit.vendorProductsModel!.data[index].prodId.toString());
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


                                child: Image.network('https://alhasnaa.site/files/${ cubit.vendorProductsModel!.data[index].prodImg!}'
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
                                cubit.vendorProductsModel!.data[index].prodNameAr!,
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,                    ),
                            ),
                            // if there is a deal show this text
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                cubit.vendorProductsModel!.data[index].prodPrice!,
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
          );});
  }
}