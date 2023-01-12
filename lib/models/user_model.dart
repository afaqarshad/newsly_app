class User {
  final String id;
  final String name;
  final String email;
  final String userpic;
  final String phoneNumber;
  final String status;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.userpic,
      required this.phoneNumber,
      required this.status});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'userpic': userpic,
      'phoneNumber': phoneNumber,
      'status': status,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        id: map['id'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        userpic: map['userpic'] as String,
        phoneNumber: map['phoneNumber'] as String,
        status: map['status'] as String);
  }
}
