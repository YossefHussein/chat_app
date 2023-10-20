import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final String message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  // final _random = Random();



  @override
  Widget build(BuildContext context) {
    // List<Color> colorRandomList = [
    //   Colors.red,
    //   Colors.blue,
    //   Colors.yellow,
    //   Colors.redAccent,
    //   Colors.yellowAccent,
    //   Colors.indigo,
    //   Colors.purpleAccent,
    //   Colors.purple,
    //   Colors.amber,
    //   Colors.cyan,
    //   Colors.teal,
    //   Colors.lime,
    //   Colors.orange,
    // ];
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

      ),
      child: Text(
        widget.message,
        style: TextStyle(fontSize: 16, color: Colors.white,),
      ),
    );
  }
}
