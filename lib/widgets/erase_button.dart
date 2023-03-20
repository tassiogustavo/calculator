import 'package:calculator/models/getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EraseButton extends StatelessWidget {
  const EraseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();

    return Expanded(
      child: InkWell(
        onTap: () {
          String newExpression = '';
          if (controller.mathExpression.value.isNotEmpty) {
            newExpression = controller.mathExpression.value
                .substring(0, controller.mathExpression.value.length - 1);
          }

          controller.updateMathExpression(newExpression);
        },
        child: const Center(child: Icon(Icons.backspace_rounded)),
      ),
    );
  }
}
