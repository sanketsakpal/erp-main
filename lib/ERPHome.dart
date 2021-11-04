import 'dart:convert';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:erp/Profile/ProfileDetails.dart';
import 'package:erp/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:http/http.dart' as http;

import 'models/profilemain.dart';

class HomepageErp extends StatefulWidget {
  // final String clientid;
  // final String username;
  // final String pasword;

  const HomepageErp({
    Key? key,
    // required this.clientid,
    // required this.username,
    // required this.pasword
  }) : super(key: key);

  @override
  _HomepageErpState createState() => _HomepageErpState();
}

class _HomepageErpState extends State<HomepageErp> {
  var nikhil = 10;
  profile_main? profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      profile = profileData;
    });
    // callme();
    // apicall();
  }

  String? data;
  // callme() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   apicall().then((value) => {
  //         setState(() {
  //           data = value;
  //         })
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: allwidgets()),
    );
  }

  Widget commonc() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 290,
          width: 300,
          // child: Text("sakshi Gothal"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Colors.purple.shade900,
              Colors.red.shade700,
            ]),
          ),
        ),
        Container(
          height: 270,
          width: 280,
          color: Colors.white.withOpacity(0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
// SizedBox(height: MediaQuery.of(context).size.height/4,),
              Text(
                "${profile?.oOWNERNAM}",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 3),
              Text(
                "${profile?.bBUILDNAM}",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Divider(thickness: 3),
              Text(
                "${profile?.pROJNAM}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Divider(thickness: 3),
              Text(
                "${profile?.oFLATNO}",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text("4545")
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  showcard(String txt, Color col, Color col1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [col, col1])),
        height: 200,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onpressButton() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: 650,
// color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  selected: true,
                                  selectedTileColor: Colors.grey[300],
                                  hoverColor: Colors.red,
                                  enabled: true,
                                  onTap: () {},
                                  leading: Text(""),
                                  subtitle: Text(""),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return Divider();
                            },
                            itemCount: 4)
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  secondOnpress() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: 650,
// color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  selected: true,
                                  selectedTileColor: Colors.grey[300],
                                  hoverColor: Colors.red,
                                  enabled: true,
                                  onTap: () {},
                                  leading: Text(""),
                                  subtitle: Text(""),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return Divider();
                            },
                            itemCount: 4)
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  thirdOnPress() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: 650,
// color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  selected: true,
                                  selectedTileColor: Colors.grey[300],
                                  hoverColor: Colors.red,
                                  enabled: true,
                                  onTap: () {},
                                  leading: Text(""),
                                  subtitle: Text(""),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return Divider();
                            },
                            itemCount: 4)
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  allwidgets() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Expanded(
              child: Column(
            children: [
              // commonc(),
              // Common().commoncrad(),
              // Common(
              //     clientid: widget.clientid,
              //     username: widget.username,
              //     pasword: widget.pasword),
              Divider(),
              Column(
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        showcard(
                            "Profile", Color(0XFFb79886), Color(0XFF775a54)),
                      ],
                    ),
                    onTap: () {
                      onpressButton();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        showcard("Loan", Color(0XFF00467F), Color(0XFFA5CC82)),
                      ],
                    ),
                    onTap: () {
                      secondOnpress();
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        showcard(
                            "MileStone", Color(0XFF9796f0), Color(0XFFfbc7d4)),
                      ],
                    ),
                    onTap: () {
                      // customBottomSheet2(context);
                      thirdOnPress();
                    },
                  )

                  // showcard("Profile", Color(0XFF57CC99)),
                  // showcard("Profile", Color(0XFF57CC99)),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  apicall() async {
    Map<String, dynamic> bodyData = {
      'clientid': '',
      'username': "",
      'password': ""
    };

    var resp = await http.post(
        Uri.parse("https://his-erp.com/API_CustApp/profile_main.php"),
        body: bodyData);

    if (resp.statusCode == 200) {
      // final jsonResponse = json.decode(resp.body);
      print("Login API");
      // print(jsonResponse);

      setState(() {
        profile = profile_main.fromJson(json.decode(resp.body));
        print(profile!.bBUILDNAM);
      });
    } else {
      throw Exception('Failed to load login from API');
    }
  }
}
