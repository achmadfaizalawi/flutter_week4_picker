import 'package:flutter/material.dart';

class PostData {
  List data = [[
    {"color": const Color(0xffb74093)},
    {"name": "Achmad Faiz Alawi"},
    {"publish": "05/03/2023"},
    {"cover": "/data/user/0/com.example.flutter_week4_picker/cache/file_picker/IMG_20230305_035644.jpg"},
    {"caption": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."}
  ]];

  List getColor(){
    List color = List.empty(growable: true);
    for(var getColor in data){
      color.add(getColor[0]['color']);
    }
    return color;
  }

  List getName(){
    List name = List.empty(growable: true);
    for(var getName in data){
      name.add(getName[1]['name']);
    }
    return name;
  }

  List getPublish(){
    List publish = List.empty(growable: true);
    for(var getPublish in data){
      publish.add(getPublish[2]['publish']);
    }
    return publish;
  }
  List getCover(){
    List cover = List.empty(growable: true);
    for(var getCover in data){
      cover.add(getCover[3]['cover']);
    }
    return cover;
  }

  List getCaption(){
    List caption = List.empty(growable: true);
    for(var getCaption in data){
      caption.add(getCaption[4]['caption']);
    }
    return caption;
  }
}