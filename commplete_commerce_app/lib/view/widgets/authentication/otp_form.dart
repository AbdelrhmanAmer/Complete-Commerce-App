import 'package:flutter/material.dart';

import '../../../controller/otp_controller.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
    required this.controller,
    this.cellWidth = 50,
  });
  final OtpController controller;
  final double cellWidth;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: cellWidth,
          child: TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpInputDecoration(),
            onChanged: (value) {
              controller.nextField(value, controller.pin2FocusNode!);
            },
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: TextFormField(
            focusNode: controller.pin2FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpInputDecoration(),
            onChanged: (value) {
              controller.nextField(value, controller.pin3FocusNode!);
            },
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: TextFormField(
            focusNode: controller.pin3FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpInputDecoration(),
            onChanged: (value) {
              controller.nextField(value, controller.pin4FocusNode!);
            },
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: TextFormField(
            focusNode: controller.pin4FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpInputDecoration(),
            onChanged: (value) {
              controller.nextField(value, controller.pin5FocusNode!);
            },
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: TextFormField(
            focusNode: controller.pin5FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpInputDecoration(),
            onChanged: (value) {
              controller.pin5FocusNode!.unfocus();
            },
          ),
        ),
      ],
    ));
  }

  InputDecoration otpInputDecoration() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      gapPadding: 0,
      borderSide: const BorderSide(color: Colors.black38),
    );
    return InputDecoration(
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
    );
  }
}
