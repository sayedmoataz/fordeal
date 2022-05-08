// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/home_cubit/home_cubit.dart';
import 'package:secondtask/layout/home.dart';
import 'package:secondtask/local/cache_helper.dart';

import 'screens/country_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getUserCart()
        ..getFeaturedCategories()..getRecommendedProducts()
        ..getFavourites()..getCountries()
        ..getBrands()
        ..setCatsListener()
        ..getMainCategories()
        ..getVendors(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fordeal',
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 250,
        duration: 3000,
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        splash: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                "assets/logo.jpg",
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
        nextScreen: CacheHelper.getData(key: 'countryId') != null
            ? HomeLayout()
            : CountryPage());
  }
}
