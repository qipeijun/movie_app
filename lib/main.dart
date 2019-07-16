import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'less_group_page.dart';
import 'statefull_group_page.dart';
import 'flutter_layout_page.dart';
import 'movie_page.dart';
import 'gesture_page.dart';
import 'res_page.dart';
import 'launch_page.dart';
import 'photo_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'flutter-app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter-app'),
          backgroundColor: _appBarBg,
        ),
        body: RouterPage(),
//        body: GridView(
//          padding: const EdgeInsets.all(10.0),
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 0.7,
//          ),
//          children: <Widget>[
//            new Image.network(imgUrl[0],fit: BoxFit.fill,),
//            new Image.network(imgUrl[1],fit: BoxFit.fill,),
//            new Image.network(imgUrl[2],fit: BoxFit.fill,),
//            new Image.network(imgUrl[3],fit: BoxFit.fill,),
//            new Image.network(imgUrl[4],fit: BoxFit.fill,),
//            new Image.network(imgUrl[5],fit: BoxFit.fill,),
//            new Image.network(imgUrl[6],fit: BoxFit.fill,),
//            new Image.network(imgUrl[7],fit: BoxFit.fill,),
//            new Image.network(imgUrl[8],fit: BoxFit.fill,),
//            new Image.network(imgUrl[9],fit: BoxFit.fill,),
//            new Image.network(imgUrl[10],fit: BoxFit.fill,),
//          ],
//        ),
      ),
      routes: <String,WidgetBuilder>{
        'less':(BuildContext context) => LessGroupPage(),
        'ful':(BuildContext context) => StateFullGroupPage(),
        'layout':(BuildContext context) => FlutterLayoutPage(),
        'movie':(BuildContext context) => MoviePage(),
        'gesture':(BuildContext context) => GesturePage(),
        'respage':(BuildContext context) => ResPage(),
        'launchpage':(BuildContext context) => LaunchPage(),
        'photo':(BuildContext context) => PhotoPage(),
      },
    );
  }
}


class RouterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RouterPage();
  }
}

class _RouterPage extends State<RouterPage>{

  bool byName = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName?'':'不'}使用路由名跳转'),
              value: byName, onChanged: (value){
            setState(() {
              byName = value;
            });
      }),
          _item('基础组件-less',LessGroupPage(),'less'),
          _item('基础组件-ful',StateFullGroupPage(),'ful'),
          _item('页面布局-layout',FlutterLayoutPage(),'layout'),
          _item('电影海报-movie',MoviePage(),'movie'),
          _item('手势-gesture',GesturePage(),'gesture'),
          _item('资源-res',ResPage(),'respage'),
          _item('打开第三方APP',LaunchPage(),'launchpage'),
          _item('拍照APP',PhotoPage(),'photo'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
          onPressed: (){
            if(byName){
              Navigator.pushNamed(context, routeName);
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
            }
          },
          child: Text(title),
      ),
    );
  }

}