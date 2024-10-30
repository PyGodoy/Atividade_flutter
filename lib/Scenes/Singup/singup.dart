import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/shared/colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isAgreedToTerms = false; // Estado da checkbox

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
                    setState(() {
                      isPasswordVisible = !isPasswordVisible; // Atualiza o estado da visibilidade
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 10),

            // Coluna para o LinkedLabel
            Row(
              children: [
                // Checkbox
                Checkbox(
                  value: isAgreedToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      isAgreedToTerms = value ?? false; // Atualiza o estado da checkbox
                    });
                  },
                ),
                // LinkedLabel para os termos de serviço
                Expanded(
                  child: LinkedLabel.instantiate(
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
                ),
              ],
            ),

            SizedBox(height: 20),

            // Botão grande de Signup, ocupando toda a largura da tela
            SizedBox(
              width: double.infinity, // Ocupa a largura total
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Signup',
                  onPressed: () {
                    // Lógica para o botão Signup
                  },
                ),
              ),
            ),
            
            SizedBox(height: 100),

            // Texto "Already Have An Account?"
            Center(
              child: Text(
                "Already Have An Account?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 10), // Espaço entre o texto e o botão de login

            // Botão grande de Login em amarelo
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary, // Estilo amarelo
                text: 'Login',
                onPressed: () {
                  // Lógica para o botão de Login
                  // Pode ser uma navegação para outra tela, por exemplo
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
