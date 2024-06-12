import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';
import '../../widgets/authentication/account_prompt.dart';
import '../../widgets/authentication/sign_in/sign_in_form.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/authentication/social_icon.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Sign Up',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .05),
                Text('Register Account',
                    style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: size.height * .03),
                Text(
                  'Complete your details or continue\nwith social media',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * .07),
                SignInForm(),
                SizedBox(height: size.height * .03),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: 'Continue',
                  press: () {},
                ),
                SizedBox(height: size.height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialIcon(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialIcon(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: size.height * .03),
                AccountPrompt(
                  promptText: 'Have an account? ',
                  actionText: 'Sign In',
                  onActionPressed: () {},
                ),
                SizedBox(height: size.height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
