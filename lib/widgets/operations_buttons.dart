import 'package:calculator/models/getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperationsButton extends StatelessWidget {
  final String text;
  const OperationsButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();

    return Expanded(
      child: InkWell(
        onTap: () {
          String newExpression = "${controller.mathExpression.value}$text";
          controller.updateMathExpression(newExpression);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(205, 251, 138, 0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
