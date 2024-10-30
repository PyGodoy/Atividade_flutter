import 'package:designsystemsampleapp/Scenes/Login/login_factory.dart';
import 'package:flutter/material.dart';

class ProfilePageRouter {
  static void logout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create('', ''))
    );
  }
}