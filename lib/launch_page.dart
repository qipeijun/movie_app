import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LaunchPage();
  }
}

class _LaunchPage extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '如何打开第三方APP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何打开第三方APP'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(onPressed: _launchURL,child: Text('点击打开第三方APP'),),
              RaisedButton(onPressed: _openMap,child: Text('点击打开地图'),),
              RaisedButton(onPressed: _openWx,child: Text('点击打开微信扫一扫'),),
            ],
          ),
        )
      ),
    );
  }

  void _launchURL() async{
    const url = 'http://www.baidu.com/';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw '打不开 $url';
    }
  }

  void _openMap() async{
    //Android
    const url = 'geo:52.32,4.917';
    if(await canLaunch(url) ){
        await launch(url);
    }else {
      //iOS
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(url)){
        await launch(url);
      }else{
        throw '打不开 $url';
      }
    }
  }





  void _openWx() async{
    const url = 'weixin://dl/scan';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw '打开 $url 失败';
    }
  }
}




