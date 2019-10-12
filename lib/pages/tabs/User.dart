import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
              // 图片填充, cover 代表自适应填充，但是会被裁切
              fit: BoxFit.cover,
              image: NetworkImage(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565519039005&di=c5e788e9d717b63bb865b50fcf2dd855&imgtype=0&src=http%3A%2F%2Fi9.hexun.com%2F2018-11-24%2F195299307.jpg')
              )
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(top: 68.0, bottom: 30.0),
              child: Row(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: ClipOval(
                        child: Image.network(
                          "https://avatar.csdn.net/6/0/6/3_xieluoxixi.jpg",
                          width: 60,
                        ),
                      ),
                    ),
                  Column(
                    children: <Widget>[
                      Text(
                        "渠元东",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),
                      ),
                      Text(
                        "1984602738@qq.com",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  )
                  
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: const Text('我的发布'),
                  trailing: const Icon(Icons.send),
                ),
                ListTile(
                  title: const Text('我的收藏'),
                  trailing: const Icon(Icons.feedback),
                ),
                ListTile(
                  title: const Text('系统设置'),
                  trailing: const Icon(Icons.settings),
                ),
                Divider(),
                ListTile(
                  title: const Text('注销'),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          )
        ],
    ));
  }
}