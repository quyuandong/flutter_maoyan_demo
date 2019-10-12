import 'package:cateye/pages/views/movie/Detail.dart';
import 'package:flutter/material.dart';
import '../../data/CustomData.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NowPlayerPage extends StatefulWidget {
  @override
  _NowPlayerPageState createState() => _NowPlayerPageState();
}

class _NowPlayerPageState extends State<NowPlayerPage> {

  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMovieList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //数组长度
      itemCount: this.list.length,
      // 每次遍历执行的回调函数， 返回值是一个Widget
      itemBuilder: (BuildContext context,int i){
        Map _myitem = list[i];

        // 如果你想给一个组件添加事件，那么就把它包裹在 GestureDetector 的内部,
        // GestureDetector 提供了很多事件供你调用
        return GestureDetector(
          // 跳转到 详情页,
          onTap: (){
            // 跳转到 详情页
            // 这是系统为我们提供的路由跳转的方法 
            // MaterialPageRoute是 material U库提供的路由组件
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context){
                return Detail(id: _myitem["id"], nm: _myitem["nm"]);
              }
            ));
          },

          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[

                // 左边的图片
                Container(
                  width: 128,
                  height: 179,
                  child: Image(
                    image: NetworkImage('${_imgReset(_myitem["img"])}'),
                  ),
                ),

                // 右边文字部分
                // Expanded 弹性盒子容器，可以占据多余空间, 自动根据父容器的宽度来填充
               Expanded(
                  child: Container(
                    height: 160,
                    // color: Colors.yellow,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      // 主轴和副轴对齐， 主轴均匀分布, 副轴居左
                      // 在竖直的方向上均匀分布
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // 在水平方向上 居左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${_myitem["nm"]}',
                          style: TextStyle(fontSize: 17),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '评分: ${_myitem["sc"] ?? "无"}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          // ?? 这个用法来自于dart，是非空判断 前者有值用前者，前者没值用后者
                          '主演: ${_myitem["star"] ?? "无"}',
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                        ),
                        Text(
                          '上映日期: ${_myitem["comingTitle"] ?? "无"}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '排期: ${_myitem["showInfo"] ?? "无"}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  //获取电影列表
  _getMovieList() async {
    try {
      String api = "http://m.maoyan.com/ajax/moreComingList?token=&movieIds=1178432%2C1205290%2C1298696%2C1260354%2C1203775%2C1215786%2C1263074%2C1223430%2C1219314%2C1170287";
      Response response =  await Dio().get(api);

      //将字符串解析成map对象
      Map responseData = jsonDecode(response.toString());
      setState(() {
        this.list = responseData['coming'];
      });
      print(responseData);
  
    } catch (e) {
      print(e);
    }
  }

  //将字符串中的/w.h/转成/128.180/
  String _imgReset(String img) => img.replaceAll('/w.h/', '/128.180/');
}