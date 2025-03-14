import 'package:flutter/material.dart';

class PokeScaffoldWidget extends StatelessWidget {
  final Widget child;

  const PokeScaffoldWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
