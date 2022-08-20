class LoginModel{

  String email;
  String password;

  LoginModel(this.email, this.password,);

  Map<String, dynamic> toMap() {
    return {
      'email_address': email,
      'password': password,
    };
  }
}