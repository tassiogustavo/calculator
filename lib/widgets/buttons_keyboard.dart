import 'package:calculator/models/getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsKeyboard extends StatelessWidget {
  final String text;

  const ButtonsKeyboard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();

    return Expanded(
      child: InkWell(
        onTap: () {
          String newExpression = "${controller.mathExpression.value}$text";
          controller.updateMathExpression(newExpression);
        },
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
