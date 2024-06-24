// U.username, K.nama_komunitas, K.tagline, P.konten, P.is_poll, 
// P.created_at, P.id_postingan, P.id_komunitas, P.email_pembuat
class Postingan {
  final String username;
  final String namaKomunitas;
  final String tagline;
  final String konten;
  final bool isPoll;
  final DateTime createdAt;
  final String idPostingan;
  final String idKomunitas;
  final String emailPembuat;

  Postingan({
    required this.username,
    required this.namaKomunitas,
    required this.tagline,
    required this.konten,
    required this.isPoll,
    required this.createdAt,
    required this.idPostingan,
    required this.idKomunitas,
    required this.emailPembuat,
    
  });

  // Factory constructor untuk membuat instance dari List<dynamic>
  factory Postingan.fromMap(List<dynamic> row) {
    return Postingan(
      username: row[0] as String, 
      namaKomunitas: row[1] as String, 
      tagline: row[2] as String, 
      konten: row[3] as String, 
      isPoll: row[4] as bool, 
      createdAt: row[5] as DateTime, 
      idPostingan: row[6] as String, 
      idKomunitas: row[7] as String, 
      emailPembuat: row[8] as String
    );
  }
}

// SELECT U.username, K.nama_komunitas, K.tagline, P.konten, P.is_poll, P.created_at, P.id_postingan, P.id_komunitas, P.email_pembuat
// FROM POSTINGAN P
// JOIN KOMUNITAS K ON P.id_komunitas = K.id_komunitas
// JOIN PENGGUNA U ON P.email_pembuat = U.email;