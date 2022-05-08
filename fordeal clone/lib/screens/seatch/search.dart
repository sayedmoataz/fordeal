import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';
import '../details_page.dart';

class SearchData extends StatelessWidget {
   SearchData({Key? key, required this.searchData}) : super(key: key);
   final String searchData;

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
    builder: (context,state){
    var cubit =HomeCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:cubit.searchModel==null?Center(child: CircularProgressIndicator(),): SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  GridView.builder(
                    itemCount:cubit.searchModel!.data.length ,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3/4,
                        crossAxisSpacing: 4, crossAxisCount: 2, mainAxisSpacing: 4),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        cubit.getSingleProduct(cubit.searchModel!.data[index].prodId.toString());
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


                                child: Image.network('https://alhasnaa.site/files/${ cubit.searchModel!.data[index].prodImg!}'
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
                                cubit.searchModel!.data[index].prodNameAr!,
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,                    ),
                            ),
                            // if there is a deal show this text
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                cubit.searchModel!.data[index].prodPrice!,
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
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.search,color: Colors.grey,),
                        Container(
                          height:25 ,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              children: [
                              Text('x    ',style: TextStyle(
                                color: Colors.white
                            ),),
                                Text(searchData,style: TextStyle(
                                  color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[600]
                          ),
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );


    });
  }
}
// return SafeArea(
// child: Scaffold(
// body: Stack(
// alignment: Alignment.topCenter,
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 12.0),
// child: Container(
// height: 60,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// MaterialButton(
// height: 40,
//
// onPressed: (){},
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)
// ),
// child: Text('search',style: TextStyle(color: Colors.white),),color: Colors.amber,),
// Expanded(
// child: Container(
// width: double.infinity,
// child: TextFieldTags(
// textFieldTagsController: cubit.searchController,
//
// textSeparators: [
// ',' //sepearate with comma as well
//
// ],
// initialTags: tags,
// onTag: (tag){
// print(tag);
// tags.add(tag);
// },
// onDelete: (tag){
// print(tag);
// //this will give single tag on delete
// tags.remove(tag);
// },
// // validator: (tag){
// //   //add validation for tags
// //   if(tag.length < 3){
// //     return "Enter tag up to 3 characters.";
// //   }
// //   return null;
// // },
// tagsStyler: TagsStyler( //styling tag style
// showHashtag: false,
// tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
// tagDecoration: BoxDecoration(color: Colors.blue[100], borderRadius: BorderRadius.circular(0.0), ),
// tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.blue[900]),
// tagPadding: EdgeInsets.all(6.0)
// ),
// textFieldStyler: TextFieldStyler( //styling tag text field
// hintText: 'enter data ',
// helperText: '',
// textFieldEnabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.amber, width: 2)
// ),
// textFieldFocusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.amber, width: 2)
// ),
// textFieldDisabledBorder:OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.amber, width: 2)
// ) ,
// textFieldBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.amber, width: 2)
// )
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// )
// ],
// ),
//
// ),
// );