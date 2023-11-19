import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quick_bite/constant/app_constant.dart';
import 'package:quick_bite/services/remote/body/sendotp_body.dart';

abstract class ImplAuthenSevice {
  Future<http.Response> sendOTP(SendOTPBody body);
}

class AuthenSevice implements ImplAuthenSevice {
  @override
  Future<http.Response> sendOTP(SendOTPBody body) async {
    const uri = AppConstant.endPointOtp;
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${null}',
        },
        body: jsonEncode(body.toJson()));
    return response;
  }
}
