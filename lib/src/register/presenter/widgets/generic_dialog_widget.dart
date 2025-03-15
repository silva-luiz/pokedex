import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';

class GenericDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const GenericDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          )),
      content: Text(
        content,
      ),
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
