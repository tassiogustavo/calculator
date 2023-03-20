import 'package:calculator/models/getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BracketButton extends StatelessWidget {
  const BracketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();

    return Expanded(
      child: Center(
        child: PopupMenuButton<int>(
          itemBuilder: (context) => [
            const PopupMenuItem(
                value: 1,
                child: Text(
                  "(",
                )),
            const PopupMenuItem(
              value: 2,
              child: Text(')'),
            ),
          ],
          elevation: 2,
          onSelected: (value) {
            if (value == 1) {
              String newExpression = "${controller.mathExpression.value}(";
              controller.updateMathExpression(newExpression);
            } else if (value == 2) {
              String newExpression = "${controller.mathExpression.value})";
              controller.updateMathExpression(newExpression);
            }
          },
          child: const Text(
            "(  )",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
