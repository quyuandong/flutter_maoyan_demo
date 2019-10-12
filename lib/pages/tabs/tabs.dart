import 'package:flutter/material.dart';
import './Home.dart';
import './NowPlayer.dart';
import './CinemaInfo.dart';
import './User.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {

  //电影的列表
  List<Widget> _pageList = [
    HomePage(),
    NowPlayerPage(),
    CinemaInfoPage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("猫眼电影"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        
        ),
      drawer: UserPage(),

      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
           this._currentIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            title: Text("正在热映")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            title: Text("影院信息")
          )
        ],
      ),
    );
  }
}

