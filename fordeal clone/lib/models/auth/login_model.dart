class LoginModel {
  String? success;
  String? tokenId;
  String? userId;
  String? userMail;
  String? userName;
  String? userPhone;



  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    tokenId = json['token_id'];
    userId = json['user_id'];
    userMail = json['user_mail'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
  }

}