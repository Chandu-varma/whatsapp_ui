import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class MessageSentBox extends StatelessWidget {
  const MessageSentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 45,
      decoration: const BoxDecoration(color: dividerColor),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.send,
                  color: Colors.green,
                ),
                fillColor: searchBarColor,
                hintText: 'type a message',
                // focusColor: searchBarColor,
                filled: true,
                // prefixIcon: Icon(Icons.smile),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic),
          ),
        ],
      ),
    );
  }
}
