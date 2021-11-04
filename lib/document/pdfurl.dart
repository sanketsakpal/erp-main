import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfurl extends StatefulWidget {
  const Pdfurl({Key? key}) : super(key: key);

  @override
  _PdfurlState createState() => _PdfurlState();
}

class _PdfurlState extends State<Pdfurl> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: SfPdfViewer.network(
              "https://google-developer-training.github.io/android-developer-fundamentals-course-concepts/en/android-developer-fundamentals-course-concepts-en.pdf")),
    );
  }
}
