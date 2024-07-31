import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';
import 'package:whatsapp_ui/features/landing/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/widgets/colours.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phonecontrolller = TextEditingController();
  Country? _country;
  @override
  void dispose() {
    super.dispose();
    phonecontrolller.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country country) {
          setState(() {
            _country = country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phonecontrolller.text.trim();
    if (_country != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signWithPhone(
            context,
            '+916303994743',
          );
    } else {
      showSnackBar(
          context: context,
          content:
              'somthing went wrong man check the phone number and country code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const CustomText(
          'enter your phone number',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center( 
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            const CustomText(
              'whatsApp need to verify your mobile number',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: pickCountry,
              child: const CustomText(
                'select country',
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_country != null) Text('+${_country!.phoneCode}'),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 200.w,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'phone number'),
                    controller: phonecontrolller,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 10,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 90,
              child: CustomButton(
                  text:'next',
                  onPressed:(){
                    sendPhoneNumber();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
