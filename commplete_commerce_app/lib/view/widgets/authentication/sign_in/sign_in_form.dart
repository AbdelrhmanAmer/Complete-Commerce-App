import 'package:flutter/material.dart';

import '../../inputDecoration.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 280; // Adjust the threshold as needed

    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: inputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                icon: const Icon(Icons.email_outlined)),
          ),
          const SizedBox(height: 30),
          TextFormField(
            decoration: inputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                icon: const Icon(Icons.lock_outline)),
            obscureText: true,
          ),
          const SizedBox(height: 30),
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (newValue) {}),
                        const Text("Remember Me"),
                      ],
                    ),
                    const SizedBox(height: 3),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (newValue) {}),
                        const Text("Remember Me"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
