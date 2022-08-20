class UserInfoModel {
  String? accessToken;
  UserData? userInfo;

  UserInfoModel({this.accessToken, this.userInfo});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    userInfo =
    json['userInfo'] != null ? UserData.fromJson(json['userInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    return data;
  }
}

class UserData {
  String? userId;
  String? phoneNumber;
  String? emailAddress;
  String? city;

  UserData(
      {this.userId,
        this.phoneNumber,
        this.emailAddress,
        this.city,
       });

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    emailAddress = json['email_address'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['phone_number'] = phoneNumber;
    data['email_address'] = emailAddress;
    data['city'] = city;
    return data;
  }
}