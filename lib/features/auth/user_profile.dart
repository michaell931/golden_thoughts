import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      avatarSize: 100,
      avatarPlaceholderColor: Colors.black,
    );
  }
}
