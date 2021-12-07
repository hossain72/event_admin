import 'package:event_admin/app/modules/home/views/widgets/qr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../controllers/scan_page_controller.dart';

class ScanPageView extends GetView<ScanPageController> {
  ScanPageView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(ScanPageController());

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 196, 1, 1),
        title: const Text('Scan'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => Opacity(
                opacity: controller.isLoading.value == true ? 0.5 : 1.0,
                child: IgnorePointer(
                  ignoring: controller.isLoading.value == true ? true : false,
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height / 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const QRScannerView());
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color.fromRGBO(55, 71, 79, 0.14),
                              radius: 60,
                              child: Icon(
                                Icons.qr_code_scanner_outlined,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          const Text(
                            'Tap/Click to open scaner',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          const Text(
                            'Scan Number',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: height / 50,
                                left: height / 50,
                                top: height / 30),
                            child: Container(
                              height: 60,
                              width: width,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 0.5),
                                  borderRadius: BorderRadius.circular(5)),
                              alignment: Alignment.center,
                              child: Obx(() => Text(
                                    controller.number.value.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextButton(
                              onPressed: () async {
                                if (controller.number.value != "") {
                                  controller.checkUser(
                                      controller.number.value, context);
                                } else {}
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: Size(width, 60),
                                  backgroundColor:
                                      const Color.fromRGBO(94, 196, 1, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      width: width,
                                      alignment: Alignment.centerRight,
                                      child: const Icon(
                                          Icons.arrow_forward_outlined)),
                                  const Text("Use Ticket"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              child: Obx(() => controller.isLoading.value == true
                  ? const Opacity(
                      opacity: 1,
                      child: CircularProgressIndicator(),
                    )
                  : Container()))
        ],
      ),
    );
  }
}
