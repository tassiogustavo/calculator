import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:get/get.dart';

import 'package:calculator/controllers/database_helper.dart';
import 'package:calculator/models/getx_model.dart';
import 'package:calculator/models/history_model.dart';
import 'package:intl/intl.dart';

class EqualButton extends StatelessWidget {
  const EqualButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetXModel>();
    final dbHelper = DatabaseHelper.instance;

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    return Expanded(
      child: InkWell(
        onTap: () {
          try {
            controller.updateMathResult(controller.mathExpression.value
                .interpret()
                .toString()
                .replaceAll(regex, ''));
            HistoryModel historyModel = HistoryModel(
                expression: controller.mathExpression.value,
                result: controller.mathResult.value,
                date: formatter.format(DateTime.now()));
            dbHelper.insert(historyModel);
          } catch (e) {
            controller.mathExpression.value.isEmpty
                ? controller.updateMathResult('')
                : controller.updateMathResult('invalid');
          }
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '=',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
