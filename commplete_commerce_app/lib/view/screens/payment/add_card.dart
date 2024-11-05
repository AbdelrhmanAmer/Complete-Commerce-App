import 'package:commplete_commerce_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';
import '../../widgets/authentication/input_decoration.dart';
import '../../widgets/root/settings/profile/profile_appbar.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: noticeAppbar(context, 'New card'),
        body: Padding(
          padding: EdgeInsets.only(
            right: 15.0,
            left: 15,
            top: 15,
            bottom: size.height * .04,
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: inputDecoration(
                        context,
                        hintText: 'Card number',
                        iconPath: 'assets/icons/card.svg',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: inputDecoration(
                        context,
                        hintText: 'Full name',
                        iconPath: 'assets/icons/card.svg',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: inputDecoration(
                              context,
                              hintText: 'CVV',
                              iconPath: 'assets/icons/card.svg',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: inputDecoration(
                              context,
                              hintText: 'Expiry date',
                              iconPath: 'assets/icons/card.svg',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(text: 'Add card', press: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
