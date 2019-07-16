import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


class LessGroupPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List imgUrl = [
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557284230.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561910374.webp',
      'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2560447448.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554017175.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2541576654.webp',
      'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555859678.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557500825.webp',
      'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2558266159.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2544510784.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2528272481.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554401295.webp'
    ];

    Color appBarBg = ColorUtil.color('#519f51');

    TextStyle textStyle = TextStyle(
      fontSize: 20.0
    );

    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          backgroundColor: appBarBg,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(color: ColorUtil.color('#ffffff')),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  'i am text',
                  style: textStyle,
                ),
                Icon(Icons.whatshot,color: ColorUtil.color('red'),size: 50.0,),
                CloseButton(),
                BackButton(),
                Chip(
                  avatar: Icon(Icons.phone_android,),
                  label: Text('chip 小部件'),
                ),
                Divider(
                  height: 10, // 容器高度
                  indent: 10, // 左侧间距
                  endIndent: 10, // 右侧间距
                  color: Colors.black38,
                ),
                Card(
                  //带有圆角，阴影，边框等效果的卡片
                  color: Colors.lightBlue,
                  elevation: 5, // 阴影
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'i am card',
                      style: textStyle,
                    ),
                  ),
                ),
                AlertDialog(
                  title: Text('盘他'),
                  content: Text('糟老头子坏得很...'),
                )
              ],
            ),
        ),
      ),
    );
  }
}