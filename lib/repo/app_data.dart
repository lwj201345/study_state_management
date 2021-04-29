import 'package:flutter/material.dart';
import 'package:study_state_management/models/message.dart';

class AppData with ChangeNotifier {
  Message sampleMessage = Message(
    id: 0,
    authorName: 'flynn',
    content: 'hello',
  );

  List<Message> messageList = [
    Message(id: 0, authorName: 'flynn', content: 'hello'),
    Message(id: 0, authorName: 'flynn', content: 'hello'),
    Message(id: 0, authorName: 'flynn', content: 'hello'),
    Message(id: 0, authorName: 'flynn', content: 'hello'),
    Message(id: 0, authorName: 'flynn', content: 'hello'),
  ];

  addMessage(Message message) {
    messageList.add(message);
    notifyListeners();
  }

  deleteMessage(Message message) {
    messageList.removeWhere((element) {
      if(element.id == message.id){
        return true;
      } else {
        return false;
      }
    });
    notifyListeners();
  }
}
