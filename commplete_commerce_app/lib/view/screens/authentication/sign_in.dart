import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';
import '../../widgets/authentication/sign_in/sign_in_form.dart';
import '../../../core/constant/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/social_icon.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Sign In',
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
                SizedBox(height: size.height * .02),
                SizedBox(
                  height: size.height * .25,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CircleAvatar(
                      child: Image.asset('assets/images/logo.png', scale: 1),
                    ),
                  ),
                ),
                SizedBox(height: size.height * .02),
                Text('Welcome Back',
                    style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: size.height * .02),
                Text(
                  'Sign in with your email and password\n or continue with social media',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * .03),
                SignInForm(),
                SizedBox(height: size.height * .02),
                CustomButton(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  text: 'Continue',
                  press: () {},
                ),
                SizedBox(height: size.height * .02),
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
                SizedBox(height: size.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                  ],
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
