class User {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String USERNAME = 'username';
  static const String PASSWORD = 'password';
  static const String ADMIN = 'admin';
  static const String USER_ROLE = 'user_role';

  int? id;
  String name;
  String username;
  String? password;
  bool admin;
  List<String>? userRole;

  User({
    this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.admin,
    this.userRole,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json[ID] as int?,
        name: json[NAME] as String,
        username: json[USERNAME] as String,
        password: json[PASSWORD] as String,
        admin: json[ADMIN] as bool,
        userRole: (json[USER_ROLE].map((e) => e).toList() as List).length > 0
            ? List<String>.from(
                json[USER_ROLE].map((e) => e.toString()).toList())
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      USERNAME: this.username,
      PASSWORD: this.password,
      ADMIN: this.admin,
      USER_ROLE: this.userRole != null
          ? this.userRole!.map((i) => i.toString()).toList()
          : null,
    };
  }
}
