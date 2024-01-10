class Student {
  String name;

  @override
  String toString() {
    return 'Student{name: $name, email: $email, mobile: $mobile, enteredAt: $enteredAt, updatedAt: $updatedAt}';
  }

  String email;
  String mobile;
  String enteredAt;
  String? updatedAt;

  Student({
    required this.name,
    required this.email,
    required this.mobile,
    required this.enteredAt,
    this.updatedAt,
  });
}
