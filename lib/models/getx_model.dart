import 'package:get/get.dart';

class GetXModel extends GetxController {
  final mathExpression = ''.obs;
  final mathResult = ''.obs;

  updateMathExpression(String text) {
    mathExpression(text);
  }

  updateMathResult(String text) {
    mathResult(text);
  }
}
