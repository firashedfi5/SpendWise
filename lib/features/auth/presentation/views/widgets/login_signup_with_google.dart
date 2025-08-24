import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/core/constants.dart';

class LoginSignupWithGoogle extends StatelessWidget {
  const LoginSignupWithGoogle({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider(color: kPrimaryColor, thickness: 1.5)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('OR'),
            ),
            Expanded(child: Divider(color: kPrimaryColor, thickness: 1.5)),
          ],
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.5, color: kPrimaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            fixedSize: Size(MediaQuery.of(context).size.width, 45),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.google),
              const SizedBox(width: 10),
              Text(
                isLogin == true ? 'Log in with Google' : 'Sign up with Google',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
