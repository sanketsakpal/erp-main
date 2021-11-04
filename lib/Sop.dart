// import 'dart:html';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'common/common.dart';
import 'models/profilemain.dart';
// import 'package:pluto_grid/pluto_grid.dart';

class TableEx extends StatefulWidget {
  TableEx({
    Key? key,
  }) : super(key: key);

  @override
  _TableExState createState() => _TableExState();
}

class _TableExState extends State<TableEx> {
  profile_main? profile;
  List postResp = [];
  bool isonline = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      // loadData();
      profile = profileData;
    });
    // callme();
    // apicall();

    isonline = false;
  }

  String? data;
  callme() async {
    await Future.delayed(Duration(seconds: 2));
    apicall().then((value) => {
          setState(() {
            data = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: [
            // Home(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: commonc(),
            // ),

            GestureDetector(
              onTap: () {
                onepressButton("18", "21", "sdsaas", "9875");
              },
              child: Column(
                children: [
                  showcard("On A/C of Agreement", Color(0XFF70e1f5),
                      Color(0XFFffd194)),
                ],
              ),
            ),
            GestureDetector(
              child: Column(
                children: [
                  showcard("On A/C of Other Charges", Color(0XFFC9FFBF),
                      Color(0XFFffafbd)),
                ],
              ),
              onTap: () {
                onepressButton("28", "21", "sdsaas", "9875");
              },
            ),
            GestureDetector(
              onTap: () {
                onepressButton("30", "21", "sdsaas", "9875");
              },
              child: Column(
                children: [
                  showcard(
                      "On A/C Of Tax", Color(0XFFf0c27b), Color(0XFF4b1248)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                onepressButton("29", "21", "sdsaas", "9875");
              },
              child: Column(
                children: [
                  showcard("TDS", Color(0XFF83a4d4), Color(0XFFb6fbff)),
                ],
              ),
            ),
          ],
        ));
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
                padding: const EdgeInsets.all(16),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }

  onepressButton(String txt, txt1, txt2, txt3) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: 500,
// color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              color: Colors.black54,
                              child: Column(
                                children: [
                                  Text(
                                    txt,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(txt1,
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.amber,
                                child: Text(
                                  txt2,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(txt3)
                          ],
                        );
                      },
                      separatorBuilder: (ctx, div) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ));
        });
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
          child: isonline
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
// SizedBox(height: MediaQuery.of(context).size.height/4,),
                    Text(
                      '${profile?.oOWNERNAM}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(thickness: 3),
                    Text(
                      '${profile?.bBUILDNAM}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Divider(thickness: 3),
                    Text(
                      '${profile?.pROJNAM}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Divider(thickness: 3),
                    Text(
                      '${profile?.oFLATNO}',
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

  apicall() async {
    Map<String, dynamic> bodyData = {};

    var resp = await http.post(
        Uri.parse("https://his-erp.com/API_CustApp/profile_main.php"),
        body: bodyData);

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_post", resp.body);

    if (resp.statusCode == 200) {
      // final jsonResponse = json.decode(resp.body);
      print("Login API");
      // print(jsonResponse);

      setState(() {
        profile = profile_main.fromJson(json.decode(resp.body));
        print(profile?.bBUILDNAM);
      });
    } else {
      throw Exception('Failed to load login from API');
    }
  }

  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var posts = pref.getString("user_post");
    if (posts != null) {
      setState(() {
        // isOnline = true;
        postResp = json.decode(posts);
      });
    }
  }
}
