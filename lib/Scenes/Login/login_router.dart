import 'package:designsystemsampleapp/Scenes/Profile/profile_factory.dart';
import 'package:designsystemsampleapp/Scenes/Singup/singup_factory.dart';
import 'package:flutter/material.dart';

class LoginPageRouter {
  static void goToProfilePage(BuildContext context, userEmail) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create(userEmail))
    );
  }

  static void goToSignupPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPageFactory.create())
    );
  }
}