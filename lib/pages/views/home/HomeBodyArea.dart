import 'package:flutter/material.dart';
import './MovieScroll.dart';

class HomeBodyArea extends StatelessWidget {

  final String title;
  HomeBodyArea({Key key, @required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
        
          Padding(
            
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Text("${title}",style: TextStyle(
                  fontSize: 18.0,height: 1.3
                ),),


                Text("更多>>", style: TextStyle(
                  color: Colors.blue
                ),)
              ],
            ),
          ),

          //电影列表显示
          // MovieScroll(),
           MovieScroll()

        ],
      ),
    );
  }
}