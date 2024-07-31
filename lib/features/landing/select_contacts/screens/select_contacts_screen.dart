import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';
import 'package:whatsapp_ui/features/landing/select_contacts/controller/select_contacts.controller.dart';

class SelectContactsScreen extends ConsumerWidget {
  const SelectContactsScreen({super.key});
  static const String routeName = '/select-contacts-screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'select Contacts'), // leading: const CustomText('select contact'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ref.watch(getcontactsprovider).when(
            data: (contactList) => ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                Contact conatct = contactList[index];
                return ListTile(
                    leading: conatct.photo == null
                        ? null
                        : CircleAvatar(
                            radius: 30,
                            backgroundImage: MemoryImage(conatct.photo!),
                          ),
                    title: CustomText(contactList[index].displayName));
              },
            ),
            error: (error, stackTrace) => ErrorScreen(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
