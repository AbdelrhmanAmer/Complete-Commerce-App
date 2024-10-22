import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controller/authentication/sign_up/terms_controller.dart';

class TermOfService extends StatelessWidget {
  const TermOfService({super.key});

  @override
  Widget build(BuildContext context) {
    TermsOfServicesController controller = Get.put(TermsOfServicesController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    'assets/icons/Share.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Last updated ${controller.lastUpdated}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text('Terms of services',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '1. Acceptance of Terms',
                  body: 'By accessing and using our ecommerce platform, '
                      'you agree to be bound by these Terms of Service and all applicable laws and regulations. '
                      'If you do not agree with any part of these terms, you are prohibited from using the service.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '2. Changes to Terms',
                  body:
                      'To access certain features of the platform, you may need to create an account. '
                      'You are responsible for maintaining the confidentiality of your account credentials '
                      'and for all activities that occur under your account.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '3. Account Creation',
                  body:
                      'To access certain features of the platform, you may need to create an account. '
                      'You are responsible for maintaining the confidentiality of'
                      ' your account credentials and for all activities that occur '
                      'under your account.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '4. Products and Services',
                  body: 'We make every effort to display accurate descriptions and pricing '
                      'of products. However, we do not guarantee that the product descriptions'
                      ' or other content are error-free. Prices are subject to change '
                      'without notice.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '5. Order Acceptance and Cancellation',
                  body: 'We reserve the right to refuse or cancel any order for any reason,'
                      ' including errors in pricing or product information, '
                      'or if we suspect fraudulent activity.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '6. Payments',
                  body: 'All payments are processed securely through our payment partners. '
                      'By providing your payment details, you agree that you are'
                      ' authorized to use the selected payment method.',
                ),
                const SizedBox(height: 20),
                termBlock(
                  context,
                  heading: '7. Shipping and Delivery',
                  body: 'We are not responsible for delays in shipping that are'
                      ' beyond our control. Any delivery timelines provided are estimates, '
                      'and we do not guarantee specific delivery dates.',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  termBlock(BuildContext context,
      {required String heading, required String body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(body,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ))
      ],
    );
  }
}
