class Student {
  String name;
  String email;
  String mobile;
  String password;
  String userId;
  String enteredAt;
  String? updatedAt;

  Student({
    required this.name,
    required this.email,
    required this.mobile,
    required this.userId,
    required this.password,
    required this.enteredAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Student{name: $name, email: $email, mobile: $mobile, password: $password, userId: $userId, enteredAt: $enteredAt, updatedAt: $updatedAt}';
  }
}
