class PertanyaanModel{
  final String pertanyaan;
  final String tipe;
  final dynamic argumen;
  dynamic jawaban;


  PertanyaanModel({
    required this.pertanyaan,
    required this.tipe,
    this.argumen,
    this.jawaban,
  });

  void setJawaban(dynamic jawab){
    jawaban = jawab;
  }

  factory PertanyaanModel.fromJson(Map<String, dynamic> json) => PertanyaanModel(
    pertanyaan: json["pertanyaan"], 
    tipe: json["tipe"],
    argumen: json["argumen"],
    jawaban: json["jawaban"]
  );

  Map<String, dynamic> toJson() => {
    "pertanyaan": pertanyaan,
    "tipe": tipe,
    "argumen": argumen,
    "jawaban": jawaban,
  };
}