class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNum;
  final String dob;

  User({
    required this.fullName,
    required this.email,
    required this.phoneNum,
    required this.dob,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullName,
      'email': email,
      'phoneNum': phoneNum,
      'DOB': dob,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullName: map['fullname'] as String,
      email: map['email'] as String,
      phoneNum: map['phoneNum'] as String,
      dob: map['DOB'] as String,
    );
  }
}
