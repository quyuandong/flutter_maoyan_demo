import 'package:flutter/material.dart';
import './pages/routes/routes.dart';

void main() {
  // new Center表示创建一个Center组件
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      
      ); 
      
  }
}

