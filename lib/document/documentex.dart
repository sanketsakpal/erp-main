import 'dart:convert';

import 'package:erp/common/common.dart';
import 'package:erp/models/profilemain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:native_pdf_viewer_plugin/pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:native_pdf_viewer_plugin/pdf_viewer_scaffold.dart';

import 'pdfurl.dart';

class Documentsex extends StatefulWidget {
  const Documentsex({Key? key, d}) : super(key: key);

  @override
  _DocumentsexState createState() => _DocumentsexState();
}

class _DocumentsexState extends State<Documentsex> {
  // List<Document> pdf = [];
  profile_main? profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // apicall();
    profile = profileData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: commonc(),
                // ),
                ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // pdfdc("");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext) => Pdfurl()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              selected: true,
                              selectedTileColor: Colors.grey[300],
                              hoverColor: Colors.red,
                              enabled: true,
                              onTap: () {},
                              title: Text("NOC"),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
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

  pdfdc(String url) {
    return Container(child: SfPdfViewer.network(url));
  }

  // apicall() async {
  //   Map<String, dynamic> bodyData = {
  //     'clientid': widget.clientid,
  //     'username': widget.username,
  //     'password': widget.pasword,
  //   };

  //   var resp = await http.post(
  //       Uri.parse("https://his-erp.com/API_CustApp/profile_main.php"),
  //       body: bodyData);

  //   if (resp.statusCode == 200) {
  //     // final jsonResponse = json.decode(resp.body);
  //     print("Login API");
  //     // print(jsonResponse);

  //     setState(() {
  //       profile = profile_main.fromJson(json.decode(resp.body));
  //       print(profile!.bBUILDNAM);
  //     });
  //   } else {
  //     throw Exception('Failed to load login from API');
  //   }
}
