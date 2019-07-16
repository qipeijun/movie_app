import 'package:flutter/material.dart';

class ResPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ResPage();
  }
}

class _ResPage extends State<ResPage>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '如何使用资源',
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用资源'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('资源'),
              Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/123.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}