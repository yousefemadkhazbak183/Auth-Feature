class UserModel {
  static const String collectionName = 'users';

  String? id;
  String? name;
  String? email;

  UserModel({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  UserModel.fromJson(Map<String, dynamic> json)
    : this(id: json['id'], name: json['name'], email: json['email']);
}
