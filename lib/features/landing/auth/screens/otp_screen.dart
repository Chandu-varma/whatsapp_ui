import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/features/landing/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class OtpScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});
  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('verifying the number'),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          const Text('we sent a code to your number'),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: '- - - - -'),
            style: const TextStyle(fontSize: 30),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.length == 6) {
                verifyOTP(ref, context, value.trim());
              }
            },
          )
        ],
      ),
    );
  }
}
