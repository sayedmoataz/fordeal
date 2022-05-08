// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/home_cubit/home_states.dart';
import 'package:secondtask/screens/home_screens/three.dart';
import 'package:secondtask/screens/home_screens/two.dart';

import '../home_cubit/home_cubit.dart';
import '../utilites/methods.dart';
import 'home_screens/four.dart';
import 'home_screens/one.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return cubit.featuredCategoriesModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : DefaultTabController(
                length: 4,
                child: Builder(builder: (context) {
                  return Scaffold(
                    body: Body(),
                  );
                }),
              );
      },
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SearchInput(shownText: 'عم تبحث ؟ ', myContext: context),
                ),
                // cardList(),
                SizedBox(
                  height: 50,
                  child: TabBar(
                      // onTap: (index){
                      //   cubit.get8SubCategories(catId: cubit.featuredCategoriesModel!.data[index].id).then((value) {
                      //     cubit.getCountryMainCategoryProducts(cubit.tabIds.toList()[index], '1');
                      //
                      //   });
                      // },
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.amber,
                      indicatorWeight: 4,
                      unselectedLabelColor: Colors.black.withOpacity(0.6),
                      labelColor: Colors.black,
                      tabs: List.generate(
                        cubit.tabsNames.length,
                        (index) => FittedBox(
                          child: Text(
                            cubit.tabsNames.toList()[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    height: height * 0.9,
                    width: double.maxFinite,
                    color: Colors.grey.withOpacity(0.2),
                    child: TabBarView(children: [
                      HomeOne(),
                      HomeTwo(),
                      ThreeHome(),
                      FourHome()
                    ]),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

List<String> TextCard = ['Popular', 'Express', 'Weman', 'Men'];
