class UserModel {
  final String? id;
  final String username;
  final String name;
  final String password;
  final String phone;

  UserModel(
      {this.id,
      required this.username,
      required this.name,
      required this.phone,
      required this.password});

  static UserModel fromMap({required Map map}) => UserModel(
    id: map['_id'],
      username: map['username'],
      name: map['name'],
      phone: map['phone'],
      password: map['password']);
}
