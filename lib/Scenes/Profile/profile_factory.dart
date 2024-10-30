import 'package:designsystemsampleapp/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:designsystemsampleapp/Scenes/Profile/profile.dart';
import 'package:flutter/material.dart';

class ProfilePageFactory {
  static Widget create(String userEmail) {
    // Inicialize o bottomTabBarViewModel antes de passá-lo ao ProfileScreen
    final bottomTabBarViewModel = BottomTabBarViewModel(
      bottomTabs: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),         // Ícone de casa
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),  // Ícone de mensagem
        BottomNavigationBarItem(icon: Icon(Icons.label), label: "Label"),       // Ícone de etiqueta (label)
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]
      ); // Ajuste conforme necessário

    return ProfileScreen(
      userEmail: userEmail,
      currentIndex: 3,
      bottomTabBarViewModel: bottomTabBarViewModel,
    );
  }
}