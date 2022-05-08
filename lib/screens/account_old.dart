import 'package:flutter/material.dart';

import 'auth_screens/login_page.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 200,
        height: 100,
        color: Colors.blue,
        onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
}
