import 'package:flutter/material.dart';

class NavBarBackBtn extends StatelessWidget {
  const NavBarBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const SizedBox(
        height: 40,
        width: 40,
        child: Center(
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
