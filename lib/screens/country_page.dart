// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mac_address/mac_address.dart';
import 'package:secondtask/local/cache_helper.dart';
import 'package:http/http.dart' as http;
import '../layout/home.dart';
import '../models/countries_models/countries_model.dart';
import '../models/insert_country_model.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  var languages = {
    'العربية': 'ar',
    'English': 'en',
    'تركيا': 'tr',
  };

  var countries = [''];
  @override
  initState() {
    getCountries();
    getCurrentLocation();
    super.initState();
    // Add listeners to this class
  }

  bool isLoading = false;

  String latitude = '00.00000';
  String longitude = '00.00000';
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = currentPosition.latitude.toString();
      longitude = currentPosition.longitude.toString();
    });
  }

  InsertCountryLangModel? insertCountryLangModel;
  Future<void> insertCountryLang(String countryId, String lang, String latitude,
      String longitude, String macAddress) async {
    var uri = Uri.https('alhasnaa.site', '/api/insert_user_country_lang', {
      // 'user_id':uid,
      'country_id': countryId,
      'lang': lang,
      'latitude': latitude,
      'longitude': longitude,
      'mac_address': macAddress
    });
    await http.get(uri).then((value) async {
      print(value.body);
      setState(() {
        insertCountryLangModel =
            InsertCountryLangModel.fromJson(jsonDecode(value.body));
      });
      print(insertCountryLangModel!.lang);
    }).catchError((e) {
      print(e.toString());
    });
  }

  CountriesModel? countriesModel;
  Future<void> getCountries() async {
    countries.clear();
    var uri = Uri.parse('https://alhasnaa.site/api/get_countries');
    await http.get(uri).then((value) async {
      print(value.body);
      setState(() {
        countriesModel = CountriesModel.fromJson(jsonDecode(value.body));
        countriesModel!.data.forEach((element) {
          countries.add(element.countryName!);
        });
        print(countries);
      });

      print(countriesModel!.data[0].countryName);
    }).catchError((e) {
      print(e.toString());
    });
  }

  // Initial Selected Value
  String dropdownCountry = 'السعودية';
  String dropdownLang = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: countriesModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/logo.jpg",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'اختار اللغة والدولة ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownCountry,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: countries.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownCountry = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownLang,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: languages.keys.toList().map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownLang = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          color: Colors.blueAccent,
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                // print(countriesModel!.data.where((element) => element.countryName==dropdownCountry).toList()[0].id.toString(),);
                                // print(,);
                                // print(latitude);
                                // print(longitude);
                                // print(await GetMac.macAddress);
                                insertCountryLang(
                                        countriesModel!.data
                                            .where((element) =>
                                                element.countryName ==
                                                dropdownCountry)
                                            .toList()[0]
                                            .id
                                            .toString(),
                                        languages.values
                                            .toList()[languages.keys
                                                .toList()
                                                .indexOf(dropdownLang)]
                                            .toString(),
                                        latitude,
                                        longitude,
                                        await GetMac.macAddress)
                                    .then((value) => {
                                          setState(() {
                                            isLoading = false;
                                          }),
                                  CacheHelper.putData(
                                      key: 'lang',
                                      value: insertCountryLangModel!
                                          .lang
                                          .toString()).then((value) {
                                            if(value){
                                              CacheHelper.putData(
                                                  key: 'countryId',
                                                  value: insertCountryLangModel!
                                                      .countryId
                                                      .toString())
                                                  .then((value) {
                                                if (value) {
                                                  CacheHelper.putData(
                                                      key: 'currency',
                                                      value: insertCountryLangModel!
                                                          .coin
                                                          .toString()).then((value) {
                                                    if(value){
                                                      CacheHelper.putData(
                                                          key: 'currencyPrice',
                                                          value: insertCountryLangModel!
                                                              .coinPrice
                                                              .toString()).then((value){
                                                        if(value){
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      HomeLayout()),
                                                                  (route) => false);
                                                        }
                                                      });
                                                    }
                                                  });


                                                }
                                              });
                                            }
                                  })


                                        })
                                    .catchError((e) {
                                  print(e.toString());
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              },
                              child: Text(
                                'حسنا',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                        )
                ],
              ),
            ),
    );
  }
}
