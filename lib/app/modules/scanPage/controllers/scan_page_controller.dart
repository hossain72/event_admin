import 'package:get/get.dart';

class ScanPageController extends GetxController {

  final number = "".obs;
  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      number.value = Get.arguments;
      update();
    }
    print("numberCode: ${number.value}");

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}