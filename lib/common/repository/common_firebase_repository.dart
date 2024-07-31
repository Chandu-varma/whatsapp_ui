import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFirebaseStorageRepository = Provider((ref) =>
    CommonFirebaseStorageRepository(firebaseStorage: FirebaseStorage.instance));

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String path, File file) async {
    TaskSnapshot taskUpload = await firebaseStorage.ref().child(path).putFile(file);
    String downloadUrl = await taskUpload.ref.getDownloadURL();
    return downloadUrl;
  }
}
