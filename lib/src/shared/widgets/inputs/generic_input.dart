import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class GenericInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? label;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const GenericInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator, // Aplicando o validador
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            floatingLabelStyle: const TextStyle(
                color: AppColors.black, fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2.5),
            ),
            suffixIcon: suffixIcon,
            labelText: label,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const PasswordInput({
    super.key,
    this.label,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.text,
          obscureText: _obscureText,
          validator: widget.validator, // Aplicando o validador
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            floatingLabelStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2.5),
            ),
            labelText: widget.label,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
