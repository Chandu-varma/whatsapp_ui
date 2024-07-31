import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/features/landing/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/landing/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/landing/screens/user_details_screen.dart';
import 'package:whatsapp_ui/features/landing/select_contacts/screens/select_contacts_screen.dart';

Route<dynamic> generaterouter(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OtpScreen.routeName:
      final String verificationId = settings.arguments.toString();
      return MaterialPageRoute(
        builder: (context) => OtpScreen(
          verificationId: verificationId,
        ),
      );
    case UserDetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserDetailsScreen(),
      );
       case  SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const  SelectContactsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'this page does\'t exist'),
        ),
      );
  }
}
