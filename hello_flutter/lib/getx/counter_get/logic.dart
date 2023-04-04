import 'package:get/get.dart';

class CounterGetLogic extends GetxController {
  var count = 0.obs;
  void increase() => ++count;
}
