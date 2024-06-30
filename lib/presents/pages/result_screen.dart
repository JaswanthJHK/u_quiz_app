import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_adv_basic_quiz/data/questions.dart';
import 'package:udemy_adv_basic_quiz/presents/widgets/answer_buttons.dart';
import 'package:udemy_adv_basic_quiz/presents/widgets/question_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.screens
  });

  final List<String> chosenAnswers;
  final VoidCallback screens;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summery.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenAnswers[i],
        },
      );
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCurrectAnswers = summeryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        // color: Color.fromARGB(255, 151, 133, 71),
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numTotalQuestions out of $numCurrectAnswers question correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.grey[100],
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummery(summeryData),
            const SizedBox(
              height: 30,
            ),
            // TextButton(onPressed: () {}, child: const Text("Restart Quiz"))
            // AnswerButton(answerText: answerText, ontap: ontap)
            TextButton.icon(
                onPressed: screens,
                icon:const Icon(Icons.restart_alt),
                label:const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
