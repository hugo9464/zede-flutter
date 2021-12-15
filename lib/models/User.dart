class User {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String userId;
  final String token;

  User({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.userId,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      userId: json['userId'],
      token: json['token'],
    );
  }
}
