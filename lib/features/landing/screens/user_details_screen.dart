import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/landing/auth/controller/auth_controller.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {
  static const String routeName = "/user-details-screen";
  const UserDetailsScreen({super.key});

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  TextEditingController namecontroller = TextEditingController();
  File? image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
  }

  void pickImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    final String name = namecontroller.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUsersDataToFirebase(name, image!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                image == null
                    ? CircleAvatar(
                        radius: 60.sp,
                        backgroundImage: const NetworkImage(
                            'https://tse2.mm.bing.net/th?id=OIP.9nyTpzPgpvxBs2vYCYxytgHaG0&pid=Api&P=0&h=180'),
                      )
                    : CircleAvatar(
                        radius: 60.sp,
                        backgroundImage: FileImage(image!),
                      ),
                Positioned(
                  bottom: -10.h,
                  right: -10.w,
                  child: IconButton(
                    onPressed: () {
                      pickImage();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.w,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: namecontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter your name',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    storeUserData();
                  },
                  icon: const Icon(Icons.done),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
