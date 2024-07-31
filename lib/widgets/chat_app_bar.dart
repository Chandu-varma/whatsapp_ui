import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class ChatAppBar extends StatelessWidget {
  final String profileName;
  const ChatAppBar({super.key,required this.profileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 3,
      padding: const EdgeInsets.all(10),
      // decoration: const BoxDecoration(
      //     border: Border(right: BorderSide(color: dividerColor))),
      color: webAppBarColor,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://wallpaperset.com/w/full/0/d/5/183330.jpg'),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(profileName),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          )
        ],
      ),
    );
  }
}
