import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: backgroundColor,
          backgroundColor: tabColor,
        ),
        child: CustomText(text));
  }
}
