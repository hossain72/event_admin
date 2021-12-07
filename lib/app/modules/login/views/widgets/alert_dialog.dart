import 'package:event_admin/app/modules/scanPage/controllers/scan_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanAlertDialog extends StatelessWidget {
  ScanAlertDialog({Key? key}) : super(key: key);

  final controller = Get.put(ScanPageController());

  dialogContent(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Obx(() => Column(
                    children: [
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        controller.status.value == "true"
                            ? 'Confirmed'
                            : 'Ticket Already Used',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      controller.status.value == "true"
                          ? Image.asset('assets/images/confirm.png')
                          : Image.asset('assets/images/error.png'),
                      SizedBox(
                        height: height / 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextButton(
                          onPressed: ()=>Get.back(),
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
                                  child:
                                      const Icon(Icons.arrow_forward_outlined)),
                              const Text("Check other ticket"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                    ],
                  ));
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
