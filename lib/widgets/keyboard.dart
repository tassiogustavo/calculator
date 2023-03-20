import 'package:calculator/widgets/all_clear_button.dart';
import 'package:calculator/widgets/bracket_button.dart';
import 'package:calculator/widgets/buttons_keyboard.dart';
import 'package:calculator/widgets/equal_button.dart';
import 'package:calculator/widgets/erase_button.dart';
import 'package:calculator/widgets/operations_buttons.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: const [
              AllClearButton(),
              BracketButton(),
              ButtonsKeyboard(text: '^'),
              OperationsButton(text: '/'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: const [
              ButtonsKeyboard(text: '7'),
              ButtonsKeyboard(text: '8'),
              ButtonsKeyboard(text: '9'),
              OperationsButton(text: '*'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: const [
              ButtonsKeyboard(text: '4'),
              ButtonsKeyboard(text: '5'),
              ButtonsKeyboard(text: '6'),
              OperationsButton(text: '-'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: const [
              ButtonsKeyboard(text: '1'),
              ButtonsKeyboard(text: '2'),
              ButtonsKeyboard(text: '3'),
              OperationsButton(text: '+'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: const [
              ButtonsKeyboard(text: '0'),
              ButtonsKeyboard(text: '.'),
              EraseButton(),
              EqualButton(),
            ],
          ),
        ),
      ],
    );
  }
}
