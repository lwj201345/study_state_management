import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_state_management/models/message.dart';
import 'package:study_state_management/repo/app_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Message _sampleMessageFromFirebase;
List<Message> _messagesFromFirebase = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Query query = FirebaseFirestore.instance.collection('collection')
    // .;
    //

    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('collection')
                .doc('U3DJ0kR7P5Ng203lFndx')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
              }

              var a = snapshot.data.data()['messageList'];
              _messagesFromFirebase =
                  List.from(a).toSet().map((e) => Message.fromJson(e)).toList();

              return ListView.builder(
                itemBuilder: (context, index) {
                  print('${snapshot.data.data()['messageList']}');

                  return _listItem(index);
                },
                itemCount: _messagesFromFirebase.length,
              );
            }),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('collection')
              .doc('U3DJ0kR7P5Ng203lFndx')
              .update(
            {
              'messageList': FieldValue.arrayUnion(
                [
                  {
                    'authorName': 'woojin',
                    'content': DateTime.now().millisecondsSinceEpoch.toString(),
                    'id': 0,
                  },
                ],
              ),
              // 'myBlogList': FieldValue.arrayUnion(
              //   [
              //     {
              //       'authorName': currentUsers.displayName,
              //       'authorImg': currentUsers.photoURL,
              //       'date': formatedDate,
              //       'title': _title.text,
              //       'imageUrl': blogUrl,
              //       'webLink': _link.text
              //     }
              //   ],
              // ),
            },
          );
          // context.read<AppData>().addMessage(
          //       Message(
          //         id: DateTime.now().millisecondsSinceEpoch,
          //         content: DateTime.now().toString(),
          //         authorName: 'woojin',
          //       ),
          //     );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListTile _listItem(int index) {
    // Message message = context.watch<AppData>().messageList[index];
    Message message = _messagesFromFirebase[index];

    return ListTile(
      onTap: () {
        context.read<AppData>().deleteMessage(message);
      },
      title: Text('${message.content}'),
      subtitle: Text('${message.authorName}'),
    );
  }

  //   if (index == 3) {
  //
  //     Message message = context.read<AppData>().sampleMessage;
  //
  //     return ListTile(
  //       title: Text('${message.content}'),
  //       subtitle: Text('${message.authorName}'),
  //     );
  //   } else {
  //     return ListTile(
  //       title: Text('title'),
  //       subtitle: Text('subtitle'),
  //     );
  //   }
  // }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Title'),
    );
  }
}
