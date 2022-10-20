import 'package:get/get.dart';

class TestPageLogic extends GetxController {
  var count = 0;
  void increate() {
    ++count;
    update();
  }
}
