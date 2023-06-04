abstract class SignupEvent{
  const SignupEvent();
}

class NameEvent extends SignupEvent{
  final String name;
  const NameEvent(this.name);
}

class PhoneEvent extends SignupEvent{
  final String phone;
  const PhoneEvent(this.phone);
}

class EmailEvent extends SignupEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignupEvent{
  final String password;
  const PasswordEvent(this.password);
}