import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
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

    return MaterialApp(
      title: '电影海报',
      home: Scaffold(
        appBar: AppBar(
          title: Text('电影海报'),
          backgroundColor: Colors.lightGreen,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          children: <Widget>[
            new Image.network(imgUrl[0],fit: BoxFit.fill,),
            new Image.network(imgUrl[1],fit: BoxFit.fill,),
            new Image.network(imgUrl[2],fit: BoxFit.fill,),
            new Image.network(imgUrl[3],fit: BoxFit.fill,),
            new Image.network(imgUrl[4],fit: BoxFit.fill,),
            new Image.network(imgUrl[5],fit: BoxFit.fill,),
            new Image.network(imgUrl[6],fit: BoxFit.fill,),
            new Image.network(imgUrl[7],fit: BoxFit.fill,),
            new Image.network(imgUrl[8],fit: BoxFit.fill,),
            new Image.network(imgUrl[9],fit: BoxFit.fill,),
            new Image.network(imgUrl[10],fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }
}