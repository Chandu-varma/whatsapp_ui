import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/info.dart';
import 'package:whatsapp_ui/widgets/messgae_card.dart';
import 'package:whatsapp_ui/widgets/sender_message.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['is me'] == true) {
          return MessgaeCard(
            date: DateTime.now().toString(),
            message: messages[index]['text'].toString(),
          );
        }
        return SenderMessageCard(
          date: messages[index]['time'].toString() ,
          message: messages[index]['text'].toString(),
        );
      },
    );
  }
}
