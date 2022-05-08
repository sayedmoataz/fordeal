import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:secondtask/screens/seatch/search.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';

class SearchTF extends StatelessWidget {
  SearchTF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HomeCubit,HomeStates>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchField(
                            controller: cubit.searchControllerTF,
                            suggestions: ['daniel','medhat','thabit'].map((e) =>
                                SearchFieldListItem(e)).toList(),
                            suggestionState: Suggestion.expand,
                            textInputAction: TextInputAction.next,
                            hint: 'enter data',
                            hasOverlay: false,
                            onSubmit: (value){

                            },
                            onSuggestionTap: (data){
                              print(cubit.searchControllerTF.text);
                            },
                            searchStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            // validator: (x) {
                            //   if (!_statesOfIndia.contains(x) || x!.isEmpty) {
                            //     return 'Please Enter a valid State';
                            //   }
                            //   return null;
                            // },
                            searchInputDecoration: InputDecoration(
                              suffixIcon:Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: MaterialButton(
                                  onPressed: (){
                                    cubit.search(cubit.searchControllerTF.text);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchData(searchData: cubit.searchControllerTF.text)));

                                  },

                                  height: 56,
                                  color: Colors.amber,
                                  child: Text('search'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                              disabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.amber),
                              ) ,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                            ),
                            maxSuggestionsInViewPort: 6,
                            itemHeight: 50,
                          ),
                        )


                      ],
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