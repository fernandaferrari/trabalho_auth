class Constants {
  // static const url_signUp =
  //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=[API_KEY]';
  // //AIzaSyAOIww9T0KIWqe0MQyNkDYWiqdFSzL83hY

  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyAOIww9T0KIWqe0MQyNkDYWiqdFSzL83hY";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}
