import 'package:event_admin/app/modules/home/views/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 196, 1, 1),
        title: const Text('Home'),
      ),
      drawer: const DrawerMenu(),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height / 100,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/scan-page');
                  },
                  child: SizedBox(
                    height: height / 5,
                    child: Image.asset(
                      'assets/images/bus.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/scan-page');
                    },
                    child: SizedBox(
                      height: height / 5,
                      child: Image.asset(
                        'assets/images/event.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/scan-page');
                    },
                    child: SizedBox(
                      height: height / 5,
                      child: Image.asset(
                        'assets/images/food.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/scan-page');
                    },
                    child: SizedBox(
                      height: height / 5,
                      child: Image.asset(
                        'assets/images/bus.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
