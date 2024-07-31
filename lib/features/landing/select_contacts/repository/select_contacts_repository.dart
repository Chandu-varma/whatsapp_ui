import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/models/user_model.dart';

final selectContactsRepositoryProvider = Provider(
    (ref) => SelectContactsRepository(firestore: FirebaseFirestore.instance));

class SelectContactsRepository {
  final FirebaseFirestore firestore;

  SelectContactsRepository({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact() async {
    try {
      var usersCollection = await firestore.collection('users').get();
      for (var user in usersCollection.docs) {
        var userData = UserModel.fromMap(user.data());
        print(userData);
      }
    } catch (e) {
      ErrorScreen(error: e.toString());
    }
  }
}
