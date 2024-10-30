import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/shared/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone no topo
            Icon(
              Icons.person_add_alt,
              size: 100,
              color: normalPrimaryBrandColor,
            ),
            SizedBox(height: 20),

            // Campo de texto para E-mail
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController,
                placeholder: 'E-mail',
                password: false,
              ),
            ),
            SizedBox(height: 16),

            // Campo de texto para Password
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    isPasswordVisible = !isPasswordVisible;
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            // LinkedLabel
            Align(
              alignment: Alignment.centerRight, // Alinha à direita
              child: LinkedLabel.instantiate(
                viewModel: LinkedLabelViewModel(
                  fullText: "Forgot Password",
                  linkedText: "Forgot Password",
                  onLinkTap: () {
                  
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            // Botão de Login
            SizedBox(
              width: double.infinity, // Ocupa a largura total
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Login',
                  onPressed: () {
                    // Lógica para o botão Signup
                  },
                ),
              ),
            ),
            
            SizedBox(height: 100),

            // Texto Don't Have An Account?
            Center(
              child: Text(
                "Don't Have An Account?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: darkTertiaryBaseColorDark,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Botão grande de Register
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary, // Estilo amarelo
                text: 'Register',
                onPressed: () {
                  // Lógica para o botão de Login
                  // Pode ser uma navegação para outra tela, por exemplo
                  Navigator.pushNamed(context, '/singup');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
