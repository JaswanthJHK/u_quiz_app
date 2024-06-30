import 'package:flutter/material.dart';
import 'package:udemy_adv_basic_quiz/data/questions.dart';
import 'package:udemy_adv_basic_quiz/presents/pages/question_screen.dart';
import 'package:udemy_adv_basic_quiz/presents/pages/result_screen.dart';
import 'package:udemy_adv_basic_quiz/presents/pages/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
//  Widget? activeScreens;

  List<String> selectedAnswers = [];

  var activeScreens = "Start_Screen";

  void switchScreens() {
    setState(() {
      activeScreens = "Questions_Screen";
    });
  }
  

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreens = "Results_Screen";
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreens = "Start_Screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreens);
    if (activeScreens == "Questions_Screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        // screen: activeScreens,
      );
      ;
    }
    if (activeScreens == "Results_Screen") {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,
      screens:restartQuiz ,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 90, 90),
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreens == "Start_Screen"
          //     ? StartScreen(switchScreens)
          //     : QuestionScreen(
          //         onSelectAnswer: chooseAnswer,
          //       ),
          child: screenWidget,
        ),
      ),
    );
  }
}
