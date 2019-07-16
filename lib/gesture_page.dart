import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GesturePage();
  }
}

class _GesturePage extends State<GesturePage> {

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

  String _printString = '需要打印的文字';
  double moveX = 0,moveY = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'GesturePage',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GesturePage'),
          backgroundColor: Colors.lightGreen,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _printMsg('点击');
                    },
                    onDoubleTap: (){
                      _printMsg('双击');
                    },
                    onLongPress: (){
                      _printMsg('长按');
                    },
                    onTapCancel: (){
                      _printMsg('取消');
                    },
                    onTapUp: (e){
                      _printMsg('松开');
                    },
                    onTapDown: (e){
                      _printMsg('按下');
                    },
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blue),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: (){
                          print('点击了');
                        },
                        child:Text('点击我',style: TextStyle(fontSize: 36,color: Colors.white),),
                      ),
                    ),
                  ),
                  Text(_printString)
                ],
              ),
              Positioned(
                //跟着运动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e){
                    setState(() {
                      moveY += e.delta.dy;
                      moveX += e.delta.dx;
                    });
                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: Colors.lightGreen,borderRadius: BorderRadius.circular(36)),
                    
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  void _printMsg(String s) {
    setState(() {
      _printString += ', $s';
    });
  }

  void _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
    print(e.toString());
  }
}