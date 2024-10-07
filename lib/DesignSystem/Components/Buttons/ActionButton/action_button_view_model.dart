import 'package:flutter/material.dart';

enum ActionButtonSize{
  small,
  medium,
  large
}

enum ActionButtonStyle{
  primary,
  secondary,
  tertiary
}

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? textColor; // Novo parâmetro de cor de texto

  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    required this.onPressed,
    this.icon,
    this.textColor, // Adicionando o novo parâmetro no construtor
  });
}