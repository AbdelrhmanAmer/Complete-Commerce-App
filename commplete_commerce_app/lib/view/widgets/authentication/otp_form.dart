import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
    required this.controller,
    this.cellWidth = 50,
  });
  final dynamic controller;
  final double cellWidth;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(5, (index) {
            return SizedBox(
              width: cellWidth,
              child: TextFormField(
                autofocus: index == 0,
                focusNode: index == 0 ? null : controller.focusNodes[index - 1],
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration(),
                onChanged: (value) {
                  if (index < 4) {
                    controller.nextField(value, controller.focusNodes[index]);
                  } else {
                    controller.focusNodes[index - 1].unfocus();
                  }
                  controller.otpCode[index] = value;
                },
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            );
          }),
        ],
      ),
    );
  }

  InputDecoration otpInputDecoration() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      gapPadding: 0,
      borderSide: const BorderSide(color: Colors.black26),
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
