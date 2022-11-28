import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';
import '../pages/my_home_page.dart';
import '../widgets/widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    _checkUserS(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: wAppLoading(),
      ),
    );
  }

  void _checkUserS(bool user) async{
    await Future.delayed(Duration(seconds: 2));
    wPushReplacement(context, user?MyHomePage():Login());
  }

}
