class RegisterModel {
  String? success;
  String? userId;
  String? tokenId;
  String? userMail;
  String? userName;


  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['user_id'];
    tokenId = json['token_id'];
    userMail = json['user_mail'];
    userName = json['user_name'];
  }
}