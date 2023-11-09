import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controllers/question_controller.dart';
import 'package:quiz_app/Model/Questions2.dart';
import 'package:quiz_app/Screens/option.dart';
import 'package:quiz_app/Utils/constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    // it means we have to pass this
    // required this.question,
    required this.question2,
  });

  // final Question question;
  final Question2 question2;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Card(
      margin: EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              question2.question,
              style: const TextStyle(color: kBlackColor),
            ),
            Text(
              "score : ${question2.score.toString()}",
              style: const TextStyle(color: kBlackColor),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question2.options.length,
                  (index) {
                final answerOption = question2.options.entries.elementAt(index);
                final answerText = answerOption.value;
                print(index.toString());

                return Option(
                  index: index,
                  text: answerText,
                  press: () => _controller.checkAns(question2, index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
