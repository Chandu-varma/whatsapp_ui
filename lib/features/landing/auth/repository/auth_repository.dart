import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/repository/common_firebase_repository.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/landing/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/landing/screens/user_details_screen.dart';
import 'package:whatsapp_ui/models/user_model.dart';
import 'package:whatsapp_ui/screens/mobile_screen.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(context, OtpScreen.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserDetailsScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        content: '$e this is from verify otp',
      );
    }
  }

  void saveUserdataToFirebase(
      {required String name,
      required File? profilePic,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = deprofile;
      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepository)
            .storeFileToFirebase('profilr/$uid', profilePic);
        debugPrint('uploaded to storage');
      }
      var user = UserModel(
          name: name,
          phoneNumber: auth.currentUser!.uid,
          profilePhoto: photoUrl,
          groupId: [],
          isOnline: true,
          uid: uid);
      await firestore.collection('users').doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const MobileScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(
          context: context, content: '$e this is from save users data');
    }
  }

  dynamic getTheUserData() async {
    var userdata =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    if (userdata.data() != null) {
      return UserModel.fromMap(userdata.data()!);
    }
  }
}
