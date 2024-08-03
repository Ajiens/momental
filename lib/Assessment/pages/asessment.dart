import 'package:flutter/material.dart';
import 'package:momental/Assessment/widget/pertanyaan.dart';
import 'package:momental/widgets/formTemplate/stepper_form.dart';

import '../../widgets/navbar.dart';
import '../models/pertanyaan_model.dart';

class Assessment extends StatelessWidget {
  const Assessment({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> halaman = []; // Halaman yang akan digenerate
    List<GlobalKey<FormState>> formKeys = []; // Key Form untuk setiap halamannya

    List<Map<String, dynamic>> pertanyaan = dummyPertanyaanJson();

    for (int i=0; i<pertanyaan.length; i++){
      GlobalKey<FormState> formKey = GlobalKey<FormState>();
      formKeys.add(formKey);

      PertanyaanModel model = PertanyaanModel.fromJson(pertanyaan[i]);

      halaman.add(TemplatePertanyaan(model: model, formKey: formKey,));
    }
    
    return StepperForm(
      judul: "Asessmen", 
      pages: halaman, 
      formKeys: formKeys,
      nextPageAfterDone: Navbar(),
    );
  }

  // Ini diganti dengan HTTP Request
  List<Map<String, dynamic>> dummyPertanyaanJson(){
    return [
      {
        "pertanyaan" : "Dalam 7 hari terakhir, seberapa sering Anda menyalahkan diri Anda sendiri ketika sesuatu terjadi tidak sebagaimana mestinya",
        "tipe" : "single-choice",  //-> Tipe2nya = "single-choice", "multiple-choice", "open-question"
        "argumen" : [
                {
                  "label": "Tidak pernah sama sekali",
                  "value": 0,
                  'checked': false
                },
                {
                  "label": "Jarang sekali",
                  "value": 1,
                  'checked': false
                },
                {
                  "label": "Ya, kadang-kadang",
                  "value": 2,
                  'checked': false
                },
                {
                  "label": "Sangat sering",
                  "value": 3,
                  'checked': false
                },
        ]
      },
      {
        "pertanyaan" : "Aktivitas apa saja yang Anda lakukan untuk menjaga kesehatan selama kehamilan ini?",
        "tipe" : "multiple-choice",  //-> Tipe2nya = "single-choice", "multiple-choice", "open-question"
        "argumen" : [
                {
                  "label": "Berjalan kaki",
                  "value": 1,
                },
                {
                  "label": "Yoga atau senam hamil",
                  "value": 2,
                },
                {
                  "label": "Istirahat yang cukup",
                  "value": 3,
                },
                {
                  "label": "Konsultasi rutin dengan dokter",
                  "value": 4,
                },
                {
                  "label": "Lainnya",
                  "value": 5,
                },
        ]
      },
      {
        "pertanyaan" : "Apakah Anda pernah mengalami mual atau muntah selama trimester pertama kehamilan Anda?",
        "tipe" : "single-choice",  //-> Tipe2nya = "single-choice", "multiple-choice", "open-question"
        "argumen" : [
                {
                  "label": "Pernah",
                  "value": 1,
                },
                {
                  "label": "Tidak Pernah",
                  "value": 0,
                },
        ]
      },
      {
        "pertanyaan" : "Bisakah Anda menjelaskan bagaimana perasaan Anda secara fisik dan emosional selama kehamilan ini?",
        "tipe" : "open-question",  //-> Tipe2nya = "single-choice", "multiple-choice", "open-question"
        
      },
    ];
  }
}