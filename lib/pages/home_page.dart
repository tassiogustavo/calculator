import 'package:calculator/models/getx_model.dart';
import 'package:calculator/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/keyboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double safePadding = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    var height =
        MediaQuery.of(context).size.height - safePadding - appBarHeight;

    final controller = Get.put(GetXModel());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Histórico",
                    style: TextStyle(color: Colors.white),
                  )),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    const Text('Trocar Tema',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 10),
                    Get.isDarkMode
                        ? const Icon(Icons.brightness_high)
                        : const Icon(Icons.brightness_2),
                  ],
                ),
              ),
            ],
            offset: const Offset(10, 60),
            color: Colors.deepPurpleAccent,
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              } else if (value == 2) {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Text(
                        controller.mathExpression.value,
                        style: const TextStyle(fontSize: 45),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => controller.mathResult.value.contains('invalid')
                          ? Text(
                              controller.mathResult.value,
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.redAccent),
                            )
                          : Text(
                              controller.mathResult.value,
                              style: const TextStyle(fontSize: 35),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.6,
              child: const Keyboard(),
            ),
          ],
        ),
      ),
    );
  }
}
