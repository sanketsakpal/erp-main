import 'package:erp/ErpTabBar.dart';
import 'package:erp/common/common.dart';
import 'package:erp/models/profilemain.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashsceen extends StatefulWidget {
  const Splashsceen({Key? key}) : super(key: key);

  @override
  _SplashsceenState createState() => _SplashsceenState();
}

class _SplashsceenState extends State<Splashsceen> {
  profile_main? profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString('log') != null &&
          pref.getString('un') != null &&
          pref.getString('PS') != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => homepage()));
      } else {
        profile = profileData;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => homepage()));

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (ctx) => homepage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/buildings.json"),
      ),
    );
  }
}
