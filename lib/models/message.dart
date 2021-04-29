import 'package:flutter/material.dart';

class Message {
  int id;
  String authorName;
  String content;
  Color color = Colors.white;

  Message({this.id, this.authorName, this.content});

  Message.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    authorName = json['authorName'] ?? '';
    content = json['content'] ?? '';
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorName'] = this.authorName;
    data['content'] = this.content;
    return data;
}

}