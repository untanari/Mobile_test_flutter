import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final String image;

  PageDetail(this.image);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Details")),
      body: Center(child: Hero(tag: "image",child: FlutterLogo(size: 300,))),
    );
  }
}