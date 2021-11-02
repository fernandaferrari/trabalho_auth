class AuthModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  AuthModel(
      {this.id, this.name, this.email, this.password, this.confirmPassword});
}
