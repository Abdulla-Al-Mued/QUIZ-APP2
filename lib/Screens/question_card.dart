import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controllers/question_controller.dart';
import 'package:quiz_app/Model/Questions2.dart';
import 'package:quiz_app/Screens/option.dart';
import 'package:quiz_app/Utils/constants.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.question2,
  });

  final Question2 question2;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
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
              widget.question2.question,
              style: const TextStyle(color: kBlackColor),
            ),
            Text(
              "question score : ${widget.question2.score.toString()}",
              style: const TextStyle(color: kBlackColor),
            ),
            Obx(() {
              return Text(
                "Total score : ${_controller.totalScore.value.toString()}",
                style: const TextStyle(color: kBlackColor),
              );
            }),

            if (widget.question2.image != null)
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.question2.image!),
                  backgroundColor: Colors.white,
                ),
              )
            else
              const SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ic_user2.png'),
                ),
              ),

            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              widget.question2.options.length,
                  (index) {
                final answerOption =
                widget.question2.options.entries.elementAt(index);
                final answerText = answerOption.value;
                print(index.toString());

                return Option(
                  index: index,
                  text: answerText,
                  press: () => _controller.checkAns(widget.question2, index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}