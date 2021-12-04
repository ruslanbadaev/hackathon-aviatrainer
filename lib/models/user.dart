enum Role {
  admin,
  user,
}

class User {
  final String? name;
  final String? password;
  final Role? role;

  User({
    this.name,
    this.password,
    this.role,
  });
}
