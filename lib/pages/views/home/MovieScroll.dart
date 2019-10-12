import 'package:flutter/material.dart';
import '../../../data/CustomData.dart';

class MovieScroll extends StatefulWidget {
  @override
  _MovieScrollState createState() => _MovieScrollState();
}

class _MovieScrollState extends State<MovieScroll> {

  //数据
  final List scrollList = CustomData().scrolllist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: scrollList.length,
        itemBuilder: (context,index){
          return ScrollItem(item: scrollList[index]);
        },
      ),
    );
  }
}

class ScrollItem extends StatelessWidget {

  final Map item;
  ScrollItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137.5,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: <Widget>[
          Container(
            child: Image(
              width: 127.5,
              height: 178.5,
              image: NetworkImage("${item["img"]}"),
               fit: BoxFit.cover,
            ),
          ),
          Text("${item['name']}"),
           Text(
            '${item["dra"]}',
            // 文字溢出点点点
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey
            ),
          ),
      
        ],
      ),
    );
  }
}