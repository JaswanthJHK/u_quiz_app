import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answerText,required this.ontap, super.key});

  final String answerText;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 209, 209),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              answerText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}




// InkWell(
//       onTap: ontap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 50,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 209, 209, 209),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 answerText,
//                 style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );