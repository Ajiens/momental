class Pengguna {
  final String email;
  final String noTelpon;
  final String password;
  final String username;
  final DateTime createdAt;

  Pengguna({
    required this.email,
    required this.noTelpon,
    required this.password,
    required this.username,
    required this.createdAt,
  });

  // Factory constructor untuk membuat instance dari List<dynamic>
  factory Pengguna.fromMap(List<dynamic> row) {
    return Pengguna(
      email: row[0] as String,
      noTelpon: row[1] as String,
      password: row[2] as String,
      username: row[3] as String,
      createdAt: row[4] as DateTime,
    );
  }

  @override
  String toString() {
    return 'Postingan{email: $email + notelpon: $noTelpon + password: $password}';
  }
}