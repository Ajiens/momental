import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Assessment/models/pertanyaan_model.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/inputField/check_field.dart';

import '../../constant/validator.dart';
import '../../widgets/inputField/radio_field.dart';
import '../../widgets/inputField/text_field.dart';

class TemplatePertanyaan extends StatelessWidget {
  final PertanyaanModel model;
  final GlobalKey<FormState> formKey;

  // Contoh implementasi dari format pertanyaan
  /*
    {
      "pertanyaan" : "Lorem ipsum Dolor sit amet?",
      "tipe" : "single-choice",  //-> Tipe2nya = "single-choice", "multiple-choice", "open-question",
      "argumen" : ["A. Pilihan 1", "B. Pilihan 2", "C. Pilihan 3", "D. Pilihan 4" ],
      "jawaban" : "",
    }
  */ 

  const TemplatePertanyaan({
    required this.model,
    required this.formKey,
    super.key
    });


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: ListView(
          children: [
            Text(model.pertanyaan,
              style: GoogleFonts.poppins(
                color: FoundationViolet.violet13,
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
            ),
            (model.tipe == "single-choice") ? singleChoice()
            : (model.tipe == "multiple-choice") ? multipleChoice()
            : openQuestion()
          ],
        ),
      ),
    );
  }

  Widget singleChoice(){
    return RadioInputField(
      isMustFilled: false,
      isVertical: true,
      value: model.jawaban,
      headerText: Text(""),
      validator: Validator.atLeastOneitem,
      items: model.argumen,
      onChanged: (value, label) {
        model.setJawaban(label);
        print(model.jawaban);
      },
    );
  }

  Widget multipleChoice(){
    return CheckInputField(
      isMustFilled: false,
      isVertical: true,
      value: model.jawaban,
      headerText: Text(""),
      validator: Validator.atLeastOneitem,
      items: model.argumen,
      onChanged: (checkedMaps, value) {
        model.setJawaban(checkedMaps);

        print(model.jawaban);
      },
    );
  }

  Widget openQuestion(){
    return CustomTextInputField(
      maxLine: 7,
      isMustFilled: false,
      inputType: TextInputType.multiline,
      fillColor: FoundationViolet.violet1,
      validator: Validator.required,
      hintText: "Masukan jawaban Anda",
      headerText: Text(""),
      value: model.jawaban,
      onChanged: (value){
        model.jawaban = value;
      },
    );
  }
}