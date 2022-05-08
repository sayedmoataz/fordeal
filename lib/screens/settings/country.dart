import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_states.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(

              appBar: AppBar(
                leading: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back_ios_rounded)),
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                centerTitle: true,
                backgroundColor: Colors.grey.shade100,
                elevation: 0.5,
                title: Text('البلد'),
              ),
              backgroundColor: Colors.grey.shade100,
              body: ListView.builder(
                itemCount: cubit.countryNames.length,
                itemBuilder: (context,index)=> ListTile(
                  trailing:Radio(
                    focusColor: Colors.red,

                    value: index+1,
                    groupValue: cubit.selectCountryValue,
                    onChanged: (value) {
                      print(value);
                      cubit.changeCountry(value);
                    },
                    activeColor: Colors.red,
                  ),
                leading: Text(cubit.countryNames[index]) ,
              ),),
            ),
          );
        });
  }
}
