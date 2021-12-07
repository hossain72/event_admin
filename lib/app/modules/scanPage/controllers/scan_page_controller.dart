import 'package:event_admin/app/modules/login/views/widgets/alert_dialog.dart';
import 'package:event_admin/app/modules/scanPage/providers/user_check_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScanPageController extends GetxController {

  final number = "01675339461".obs;
  final localStorage = GetStorage();
  final token = ''.obs;
  final isLoading = false.obs;
  final status = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getToken();
    if(Get.arguments!=null){
      number.value = Get.arguments;
      update();
    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getToken(){
    token.value = localStorage.read('token');
    print(token.value);
    update();
  }

  checkUser(String mobileNumber, BuildContext context) async {
    try {
      isLoading(true);
      var checkUser = await UserCheckProvider().checkUser(mobileNumber, token.value);
      if (checkUser != null) {
        status.value = checkUser.success!.toString();
        print(status.value);
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return ScanAlertDialog();
            });
        update();
      } else {}
    } finally {
      isLoading(false);
      update();
    }
  }

}
