class Account {
  final int id;
  final String username;
  final String email;
  final String password;

  const Account({
    required this.id,
    required this.username,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password' : password
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Account{id: $id, name: $username, email: $email, password: $password}';
  }

}

