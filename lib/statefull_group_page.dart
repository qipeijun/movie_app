import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


class StateFullGroupPage extends StatefulWidget {
  @override
  _StateFullGroupPage createState()=> _StateFullGroupPage();
}



class _StateFullGroupPage extends State<StateFullGroupPage>{

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
      title: 'StatefullWidget与基础组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefullWidget与基础组件'),
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
                              margin: EdgeInsets.only(top: 10,bottom: 20),
                              decoration: BoxDecoration(color: Colors.lightBlueAccent),
                              child: PageView(
                                children: <Widget>[
                                  _item('Page1',Colors.deepPurple),
                                  _item('Page2',Colors.lightBlueAccent),
                                  _item('Page3',Colors.lightGreen),
                                  _item('Page4',Colors.limeAccent),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onRefresh: _handleRefresh
              )
            : Text(_handleName()),
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

}