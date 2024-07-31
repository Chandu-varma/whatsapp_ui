 class UserModel {
  final String name;
  final String phoneNumber;
  final String profilePhoto;
  final List<String> groupId;
  final bool isOnline;
  final String uid;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.groupId,
    required this.isOnline,
    required this.uid,
  });

  // Create a UserModel from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePhoto: map['profilePhoto'] as String,
      groupId: List<String>.from(map['groupId'] as List),
      isOnline: map['isOnline'] as bool,
      uid: map['uid'] as String,
    );
  }

  // Convert a UserModel to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePhoto': profilePhoto,
      'groupId': groupId,
      'isOnline': isOnline,
      'uid': uid,
    };
  }
}

