import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/landing/auth/repository/auth_repository.dart';
import 'package:whatsapp_ui/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});
final userDataAuthprovider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getTheUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  Future<UserModel?> getTheUserData() async {
    UserModel? user = await authRepository.getTheUserData();
    return user;
  }

  AuthController({required this.authRepository, required this.ref});
  void signWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUsersDataToFirebase(
      String name, File profilePic, BuildContext context) {
    authRepository.saveUserdataToFirebase(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}
