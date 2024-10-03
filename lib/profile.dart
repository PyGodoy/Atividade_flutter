import 'package:flutter/material.dart';
import 'package:designsystemsampleapp/DesignSystem/shared/colors.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';

class ProfileScreen extends StatelessWidget {
  final BottomTabBarViewModel bottomTabBarViewModel;
  final int currentIndex;

  ProfileScreen({
    super.key,
    required this.bottomTabBarViewModel,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      appBar: AppBar(
        backgroundColor: lightTertiaryBaseColorLight,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: darkPrimaryBaseColorLight,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile icon and info
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: normalPrimaryBrandColor,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mikaell Godoy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkPrimaryBaseColorLight,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'godoyvitorio99@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: lightPrimaryBaseColorLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

            // Options with arrow
            ListTile(
              title: Text('Edit name'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Lógica para editar nome
              },
            ),
            Divider(),
            ListTile(
              title: Text('Shipping Info'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Lógica para informações de envio
              },
            ),
            Divider(),
            ListTile(
              title: Text('Notification'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Lógica para notificações
              },
            ),
            Divider(),
            ListTile(
              title: Text('Terms & Condition'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Lógica para os termos e condições
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Lógica para logout
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: bottomTabBarViewModel, 
        currentIndex: currentIndex,
      ),
    );
  }
}
