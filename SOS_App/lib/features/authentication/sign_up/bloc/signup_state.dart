class SignupState {
  final String name;
  final String phone;
  final String email;
  final String password;

  const SignupState(
      { this.name = "",
       this.phone = "",
       this.email = "",
       this.password = ""});

  SignupState copywith(
      {String? name, String? phone, String? email, String? password}) {
    return SignupState(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
