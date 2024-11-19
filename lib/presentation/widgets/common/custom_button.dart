import 'package:flutter/material.dart';
import 'package:extreme_work_outs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50), // Tamaño mínimo
        textStyle: TextStyle(fontSize: 18), // Estilo del texto
        backgroundColor: AppColors.secondaryColor, // Color de fondo personalizado (#A50C37)
        foregroundColor: Colors.white, // Color del texto (blanco)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2), // Bordes redondeados
        ),
        elevation: 5, // Elevación para sombra
      ),
    );
  }
}
