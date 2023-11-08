

import 'package:get/get.dart';
import 'package:quiz_app/Utils/SharedPreferenceUtil.dart';
import 'package:quiz_app/Utils/constants.dart';

class HomePageController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final RxInt _totalScore = 0.obs; // Use a reactive variable
  RxInt get totalScore => _totalScore;

  @override
  void onInit(){

    getScoreData();

    super.onInit();

  }


  Future<void> getScoreData() async {
    int? _score = await SharedPref.getIntData(score);
    print(_score.toString());
    if (_score != null) {
      _totalScore.value = _score;
    }
    print(totalScore);

  }

}