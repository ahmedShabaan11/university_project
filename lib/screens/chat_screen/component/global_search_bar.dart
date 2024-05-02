import 'package:flutter/material.dart';
import 'package:university/screens/chat_screen/component/chat_item.dart';

class GlobalSearchBar extends StatefulWidget {
  List<String> items;
  void Function()? isVisible;
  GlobalSearchBar({super.key, required this.items, required this.isVisible});

  @override
  State<GlobalSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<GlobalSearchBar> {
  String value="";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (v){
              value=v;
              setState(() {

              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.red),
                // borderRadius: BorderRadius.circular(15),
              ),
                suffixIcon: InkWell(
              onTap: widget.isVisible,
              child: Icon(Icons.close),
            )),
          ),
          Expanded(child: ListView.builder(itemCount: widget.items.length,itemBuilder: (context, index) {
            if(widget.items[index].contains(value)){
              return ChatItem(title: widget.items[index]);
            }
            if(value.isEmpty){
              return ListTile(
                tileColor: Colors.red,
                title: Text(widget.items[index]),
              );
            }
            return Container();
          }))
        ],
      ),
    );
  }
}
