import 'package:flutter/material.dart';
import '../views/home/HomeBodyArea.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HomeBodyArea(title: '最新电影'),
        HomeBodyArea(title: '最新电视剧'),
        HomeBodyArea(title: '最新动漫'),
        HomeBodyArea(title: '最新综艺'),
      ],
    );
  }
}

