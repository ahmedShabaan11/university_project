import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String title;
  ChatItem({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title,style: TextStyle(fontSize: 17),),
        leading: Icon(Icons.chat),
      ),
    );;
  }
}
