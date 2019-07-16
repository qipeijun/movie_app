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

  File _image;

  Future getImage(isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(source:isTakePhoto? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '拍照APP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('拍照APP'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: '选择图片',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

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

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto?Icons.camera_alt:Icons.photo_library),
        title: Text(title),
        onTap: ()=> getImage(isTakePhoto),
      ),
    );
  }
}