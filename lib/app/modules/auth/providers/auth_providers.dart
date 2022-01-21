import 'package:dio/dio.dart';
import 'package:vms_employee_flutter/app/data/common.dart';

class AuthProviders {
  static Dio dio = dioClient;

  Future<void> sendUserTokens(
      {required String? uid, required String? fcmToken}) async {
    const url = "$apiUrl/employee/saveFcmToken";

    final Map<String, String?> data = {
      "uid": uid,
      "fcmToken": fcmToken,
    };

    try {
      await dio.post(url, data: data);
    } on DioError catch (e) {
      showSnackBar(title: e.message);
    }
  }
}
