import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/landing/select_contacts/repository/select_contacts_repository.dart';

final getcontactsprovider = FutureProvider((ref) {
  final selectContactsRepository = ref.watch(selectContactsRepositoryProvider);
  return selectContactsRepository.getContacts();
});
