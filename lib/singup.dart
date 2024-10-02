import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/shared/colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
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

            SizedBox(height: 10),

            // Coluna para o LinkedLabel
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinha o LinkedLabel à esquerda
              children: [
                SizedBox(
                    height: 1), // Espaço entre o campo de senha e o LinkedLabel

                // LinkedLabel para os termos de serviço
                LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                    fullText: "I have read and agree to Terms & Services",
                    linkedText: "Terms & Services",
                    onLinkTap: () {
                      // Lógica para abrir os Termos e Serviços
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Terms & Services"),
                            content: Text("Aqui estão os termos e serviços..."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Fechar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Botão grande de Signup
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: 'Signup',
                onPressed: () {
                  // Lógica para o botão Signup
                },
              ),
            ),
            SizedBox(height: 20),

            // Texto e botão para Login
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Already have An Account?",
                linkedText: "Login",
                onLinkTap: () {
                  // Navegar para a tela de login
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
