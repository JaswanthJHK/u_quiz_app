import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(119, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
           Text(
            "Learn Flutter in a fun way!",
           style: GoogleFonts.lato(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold,),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey,
              side: const BorderSide(
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
            label:  Text("Start Quiz",style: GoogleFonts.lato(),),
            
          ),
        ],
      ),
    );
  }
}
