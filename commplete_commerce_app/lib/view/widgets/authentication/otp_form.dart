import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
    required this.controller,
    this.cellWidth = 70,
  });
  final dynamic controller;
  final double cellWidth;

  @override
  Widget build(BuildContext context) {
    final nodesNumber = controller.focusNodes.length + 1;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(nodesNumber, (index) {
            return SizedBox(
              height: 80,
              width: cellWidth,
              child: TextFormField(
                autofocus: index == 0,
                focusNode: index == 0 ? null : controller.focusNodes[index - 1],
                keyboardType: TextInputType.number,
                style: Get.textTheme.titleLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (index < nodesNumber-1) {
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
}
