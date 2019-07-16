import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPage createState()=> _FlutterLayoutPage();
}



class _FlutterLayoutPage extends State<FlutterLayoutPage>{

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

  Color _appBarBg = ColorUtil.color('#519f51');

  TextStyle textStyle = TextStyle(
      fontSize: 20.0
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: '如何进行flutter布局开发',
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行flutter布局开发'),
          backgroundColor: _appBarBg,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.people,color: Colors.grey,),
                activeIcon: Icon(Icons.people,color: Colors.lightBlue,),
                title: Text('people')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone,color: Colors.grey,),
                activeIcon: Icon(Icons.phone,color: Colors.lightBlue,),
                title: Text('phone')
            )
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            onPressed: null,
            child: Text('点我呀'),
        ),
        body: _currentIndex == 0 ?
              RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(imgUrl[0],fit: BoxFit.fill,),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      // 圆角
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      child: Opacity(opacity: 0.6,
                                      child: Image.network(imgUrl[0],fit: BoxFit.fill,width: 100,),
                                      ), //60% 透明度
                                    ),
                                ),
                              ],
                            ),

                            Image.network(imgUrl[0],fit: BoxFit.fill,),
                            Image.network(imgUrl[1],fit: BoxFit.fill,),
                            Image.network(imgUrl[2],fit: BoxFit.fill,),
                            Image.network(imgUrl[3],fit: BoxFit.fill,),
                            TextField(
                              // 文本框样式
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: '请输入姓名',
                                hintStyle: TextStyle(fontSize: 18)
                              ),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.transparent),
                              child: PhysicalModel(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAlias, //抗锯齿
                                  child: PageView(
                                    children: <Widget>[
                                      _item('Page1',Colors.deepPurple),
                                      _item('Page2',Colors.lightBlueAccent),
                                      _item('Page3',Colors.lightGreen),
                                      _item('Page4',Colors.limeAccent),
                                    ],
                                  ),
                              )
                            ),
                            Column(
                              children: <Widget>[
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.red),
                                    child: Text('宽度撑满我',style: textStyle,),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Image.network(imgUrl[0],width: 100,),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(imgUrl[0],width: 50,),
                          )
                        ],
                      ),
                      Wrap(
                        //创建一个wrap布局，从左向右进行排列，会自动换行
                        spacing: 8, // 水平间距
                        runSpacing: 6, // 垂直间距
                        children: <Widget>[
                          _chip('Flutter'),
                          _chip('JavaScript'),
                          _chip('Java'),
                          _chip('vue'),
                        ],
                      ),
                    ],
                  ),
                  onRefresh: _handleRefresh
              )
            : Column(
                children: <Widget>[
                  Text('列表',style: textStyle,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('拉伸填满高度'),
                    ),
                  )
                ],
        ),
      ),
    );
  }


  ///
  /// 列表延时200ms刷新
  ///
  Future<Null>_handleRefresh() async{
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  String _handleName(){
    return '戚培俊';
  }

  _item(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(title,style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(label.substring(0,1),style: textStyle,),
      ),
    );
  }

}