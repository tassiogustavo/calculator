import 'package:calculator/models/getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllClearButton extends StatelessWidget {
  const AllClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();

    return Expanded(
      child: InkWell(
        onTap: () {
          controller.updateMathExpression('');
          controller.updateMathResult('');
        },
        child: const Center(
          child: Text(
            'AC',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
