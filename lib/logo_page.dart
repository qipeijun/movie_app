import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogoPage();
  }
}


class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key,Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final Animation<double> animation = listenable;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: Image.asset('images/123.jpg'),
      ),
    );
  }

}


class _LogoPage extends State<LogoPage> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 2500));
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
    ..addListener((){
      setState(() {
        animationValue = animation.value;
      });
    })
    ..addStatusListener((AnimationStatus state){
      setState(() {
        animationStatus = state;
      });
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '动画',
      home: Scaffold(
        appBar: AppBar(
          title: Text('动画'),
          backgroundColor: Colors.deepOrange,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      controller.reset();
                      controller.forward();
                    },
                    child:Text('Start',textDirection: TextDirection.ltr,),
                  ),
                Text(
                  'State:'+animationStatus.toString(),
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  'Value:'+animationValue.toString().padRight(5).substring(0,5),
                  textDirection: TextDirection.ltr,
                ),
                Container(
                  child: new AnimatedLogo(animation: animation,),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
