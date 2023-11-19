// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterBody {
  String? name;
  String? email;
  String? password;
  int? age;
  String? code;
  RegisterBody();
  factory RegisterBody.fromJson(Map<String, dynamic> jsonData) {
    return RegisterBody()
      ..name = jsonData['name']
      ..email = jsonData['email']
      ..password = jsonData['password']
      ..age = jsonData['age']
      ..code = jsonData['code'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'code': code
    };
  }
}
