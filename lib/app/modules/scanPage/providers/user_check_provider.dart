import 'dart:convert';
import 'package:event_admin/app/data/api_link.dart';
import 'package:event_admin/app/modules/scanPage/models/user_check_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserCheckProvider extends GetConnect {
  Future<UserCheckModel?> checkUser (String mobileNumber, String token) async {
    final String url =
        "${ApiLink.BASE_API_LINK}api/update";
    Map body = {
      "phone": mobileNumber,
    };

    final response = await http.put(Uri.parse(url),
        body: body,
        headers: {"Accept": "application/json", "Authorization": 'Bearer $token'});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseString = response.body;
      return UserCheckModel.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }
}
