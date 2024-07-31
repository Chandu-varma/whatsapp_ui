import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui/widgets/chat_app_bar.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';
import 'package:whatsapp_ui/widgets/contact_list.dart';
import 'package:whatsapp_ui/widgets/message_sent_box.dart';
import 'package:whatsapp_ui/widgets/messgae_card.dart';
import 'package:whatsapp_ui/widgets/web_profile_bar.dart';
import 'package:whatsapp_ui/widgets/web_search_bar.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                WebProfileBar(),
                WebSearchBar(),
                Expanded(child: ContactList()),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/whatsapp_background.jpg'),
                    fit: BoxFit.cover),
              ),
              child: const Column(
                children: [
                  ChatAppBar(
                    profileName: 'chandu varma',
                  ),
                  Expanded(
                    child: ChatList(),
                  ),
                   MessageSentBox(),
                ],
              ),
            ),
          )

          //   Column(
          //     children: [
          //       //web profilebar
          //       //web searchbar
          //       SizedBox(
          //           width: MediaQuery.of(context).size.width * 0.25,
          //           child: const ContactList()),
          //     ],
          //   ),
          //   Container(
          //     width: MediaQuery.of(context).size.width * 0.75,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('asset/whatsapp_background.jpg'),
          //           fit: BoxFit.cover),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
