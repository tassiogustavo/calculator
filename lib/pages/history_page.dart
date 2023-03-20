import 'package:calculator/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/database_helper.dart';
import '../models/getx_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HistoryModel> myHistorys = [];
  final dbHelper = DatabaseHelper.instance;

  final controller = Get.find<GetXModel>();

  @override
  void initState() {
    _getAllHistorys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Histórico'),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "Apagar Histórico",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            offset: const Offset(10, 60),
            color: Colors.deepPurpleAccent,
            elevation: 2,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 1) {
                dbHelper.deleteAll();
                _getAllHistorys();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: myHistorys.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.updateMathExpression(myHistorys[index].expression);
                controller.updateMathResult(myHistorys[index].result);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      myHistorys[index].date,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        myHistorys[index].expression,
                        style: const TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        myHistorys[index].result,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _getAllHistorys() {
    dbHelper.getAll().then((list) {
      setState(() {
        myHistorys = list;
      });
    });
  }
}
