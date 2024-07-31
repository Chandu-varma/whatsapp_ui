import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';
import 'package:whatsapp_ui/features/landing/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: CustomText(
              'Welcome to WhatsApp',
              fontSize: 33,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('Whatsapp_background.jpg'),
            radius: 160,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: CustomText(
              'this is the privacy policy text of whats app ui App',
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "AGREE AND CONTINUE",
            onPressed: () {
              navigateToLoginScreen(context);
            },
          ),
        ],
      ),
    ));
  }
}
