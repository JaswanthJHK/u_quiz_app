import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
            children: summeryData.map((data) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: data['correct_answer'] == data['chosen_answer']
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'] as String,
                          style: TextStyle(
                            color: Colors.green[200],
                          )),
                      Text(
                        data['chosen_answer'] as String,
                        style: TextStyle(
                          color: data['correct_answer'] == data['chosen_answer']
                              ? Colors.green[200]
                              : Colors.red[200],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
