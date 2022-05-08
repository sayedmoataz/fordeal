// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondtask/home_cubit/home_cubit.dart';
import 'package:secondtask/home_cubit/home_states.dart';
import 'package:secondtask/local/cache_helper.dart';
import 'package:secondtask/screens/settings/country.dart';
import 'package:secondtask/screens/settings/language.dart';

import '../auth_screens/login_page.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.grey.shade100,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text('الاعدادات'),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCountry())).then((value) {
                        });
                      },
                      child: settingsRow(
                        settingLabel: 'البلد',
                        icon: Icons.language,
                        pickedSetting:cubit.countryNames[(int.parse(CacheHelper.getData(key: 'countryId').toString(),)-1)]
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLang())).then((value){

                        });

                      },
                      child: settingsRow(
                        pickedSetting: cubit.languages[CacheHelper.getData(key: 'lang')].toString(),
                        settingLabel: 'اللغات',
                        icon: Icons.card_travel,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    settingsRow(
                      pickedSetting: 'Man',
                      settingLabel: 'Gender',
                      icon: Icons.h_plus_mobiledata_rounded,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 60,
                          color: Colors.white,
                          width: double.maxFinite,
                          child: Center(
                            child: Text('تديل الحساب'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: InkWell(
                          onTap: (){
                            if(CacheHelper.getData(key: 'uid')!=null){
                              cubit.logOut();
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 60,
                            color: Colors.white,
                            width: double.maxFinite,
                            child: Center(
                              child: Text(CacheHelper.getData(key: 'uid')==null?
                                'تسجيل الدخول':'تسجيل الخروج',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}


class settingsRow extends StatelessWidget {
  const settingsRow({
    Key? key,
    required this.settingLabel,
    required this.icon,
    required this.pickedSetting,
  }) : super(key: key);
  final String settingLabel;
  final IconData icon;
  final String pickedSetting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        color: Colors.white,
        width: double.maxFinite,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(settingLabel)
              ],
            ),
            Row(
              children: [
                Text(
                  pickedSetting,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
