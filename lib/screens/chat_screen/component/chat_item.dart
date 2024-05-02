import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String title;
  String type;
  void Function()? onTap;
  ChatItem({super.key,required this.title,required this.type,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: onTap,
        title: Text(title,style: TextStyle(fontSize: 17),),
        leading: Icon(Icons.chat),
        trailing: Text(type,style: TextStyle(fontSize: 17),),
      ),
    );;
  }
}
