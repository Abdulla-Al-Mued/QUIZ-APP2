
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/Controllers/home_page_controller.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';
import 'package:quiz_app/Utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    HomePageController _controller = Get.put(HomePageController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Quiz App",
            style: TextStyle(
              color: Color(0Xff634099),
            )),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Obx(() {
                    return Text(
                        "High Score : ${_controller.totalScore} ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: kGrayColor, fontWeight: FontWeight.bold, fontSize: 26 )
                    );
                  }),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.to(() => const QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Text(
                        "Start Quiz",
                      ),
                    ),
                  ),
                  const SizedBox(height: 60)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
