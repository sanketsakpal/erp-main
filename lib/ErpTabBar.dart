import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:erp/ERPHome.dart';
import 'package:erp/api/APIManager.dart';
import 'package:erp/common/common.dart';

import 'package:erp/document/documentex.dart';
import 'package:erp/loginscreen.dart';
import 'package:erp/models/profilemain.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sop.dart';

class homepage extends StatefulWidget {
  // final String clientid;
  // final String username;
  // final String pasword;
  const homepage({
    Key? key,
    // required this.clientid,
    // required this.username,
    // required this.pasword
  }) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  profile_main? profile;
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 12.0,
    // fontFamily: 'Horizon',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      profile = profileData;
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/logo2.png",
              fit: BoxFit.contain,
              height: 32,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 5, bottom: 5),
            //   child: CircleAvatar(
            //     radius: 30.0,
            //     backgroundImage: AssetImage("assets/logo1.jpeg"),
            //     backgroundColor: Colors.transparent,
            //   ),
            // ),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                "HIS-ERP",
                style: TextStyle(color: Color(0XFF06074F)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 3),
              child: AnimatedTextKit(animatedTexts: [
                ColorizeAnimatedText(
                  'Premise Owners Dashboard',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  // speed: Duration(milliseconds: 1000),
                ),
              ]),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(
                child: Text("Send Request"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text("Settings"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text("Logout"),
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove("log");
                  pref.remove("un");
                  pref.remove("PS");

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => RoastedHome()));
                },
              )
            ],
          ),
        ],
        centerTitle: true,
        // bottom: TabBar(
        //   labelColor: Colors.white,
        //   unselectedLabelColor: Colors.white,
        //   controller: _tabController,
        //   tabs: <Widget>[
        //     Tab(
        //       child: Text("Profile",
        //           style: TextStyle(color: Colors.white, fontSize: 15)),
        //     ),
        //     Tab(
        //       child: Text("SOP",
        //           style: TextStyle(color: Colors.white, fontSize: 15)),
        //     ),
        //     Tab(
        //       child: Text("File",
        //           style: TextStyle(color: Colors.white, fontSize: 15)),
        //     )
        //   ],
        // ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        "assets/icon1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${profile?.oFLATNO}",
                    style: TextStyle(
                        fontFamily: 'Gilroy1',
                        fontSize: 32,
                        color: Color(0XFFe08d6b)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${profile?.oOWNERNAM}",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        color: Color(0XFF7a7b7f)),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    color: Color(0XFF2d2f2e),
                    height: 25,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${profile?.bBUILDNAM}",
                          style: TextStyle(
                              fontFamily: 'Gilroy2',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFd5ba4e)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${profile?.pROJNAM}",
                          style: TextStyle(
                              fontFamily: 'Gilroy2',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFd5ba4e)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(color: Color(0XFF202427)),
        ),
        TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text("Profile",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            Tab(
              child: Text("SOP",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            Tab(
              child: Text("File",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            )
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: <Widget>[
            HomepageErp(),
            TableEx(),
            Documentsex(),
          ]),
        ),
      ])

          // TabBarView(controller: _tabController, children: <Widget>[
          //   HomepageErp(),
          //   TableEx(),
          //   Documentsex(),
          // ]

          ),
    );
  }
}
