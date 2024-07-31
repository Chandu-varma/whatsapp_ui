import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.width * 0.04,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          filled: true,
          fillColor: searchBarColor,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search),
          ),
          hintText: 'search',
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
