// ignore_for_file: public_member_api_docs, sort_constructors_first
class SendOTPBody {
  String? email;
  SendOTPBody();
  factory SendOTPBody.fromJson(Map<String, dynamic> jsonData) {
    return SendOTPBody()..email = jsonData['email'];
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
