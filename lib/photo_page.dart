import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhotoPage();
  }
}

class _PhotoPage extends State<PhotoPage>{

  List<File> _images = [];

  File _image;

  Future getImage(isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(source:isTakePhoto? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '拍照',
      home: Scaffold(
        appBar: AppBar(
          title: Text('拍照'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _getImages(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: '选择图片',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  /// 下拉菜单 弹框
  void _pickImage() {
    showModalBottomSheet(context: context, builder: (context)=>Container(
      height: 160,
      child: Column(
        children: <Widget>[
          _item('拍照',true),
          _item('从相册选择',false),
        ],
      ),
    ));
  }

  /// 下拉菜单 item
  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto?Icons.camera_alt:Icons.photo_library),
        title: Text(title),
        onTap: ()=> getImage(isTakePhoto),
      ),
    );
  }

  /// 图片列表
  _getImages() {
    return _images.map((item){
      return Stack(
        children: <Widget>[
          ClipRRect(
            // 圆角效果
            borderRadius: BorderRadius.circular(5),
            child: Image.file(item,width: 120,height: 100,fit: BoxFit.fill,),
          ),
          Positioned(
          right: 5,
          top: 5,
          child: GestureDetector(
            onTap: (){
              setState(() {
                _images.remove(item);
              });
            },
            child: ClipOval(
              // 圆角删除按钮
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(color: Colors.black54),
                child: Icon(Icons.close,size: 18,color: Colors.white,),
              ),
            ),
          )
          ),
        ],
    );
    }).toList();
  }
}