import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controllers/question_controller.dart';
import 'package:quiz_app/Screens/question_card.dart';
import 'package:quiz_app/Utils/constants.dart';
import 'package:quiz_app/Utils/progress_bar.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",

                      children: [
                        TextSpan(
                          text: "/${_questionController.questions2.length}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions2.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question2: _questionController.questions2[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
