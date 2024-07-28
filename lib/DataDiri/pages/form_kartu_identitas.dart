import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/DataDiri/controller/kartu_identitas_controller.dart';

import '../../constant/color_pallete.dart';
import '../../constant/validator.dart';
import '../../widgets/inputField/drop_down_field.dart';
import '../../widgets/inputField/text_field.dart';

class KartuIdentitas extends StatelessWidget {
  final KartuIdentitasController controller;


  const KartuIdentitas({
    required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 80),
        child: ListView(
          children: [
            DropDownInputField(
              inputSugest: "Pilih Jenis Identitas",
              isMustFilled: true,
              headerText: Text("Jenis Kartu Identitas",
                style: GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
              validator: Validator.required,
              headerIcon:  const Icon(
                Icons.credit_card,
                size: 20,
                color: Style.secondary,
              ),
              value: controller.jenisKartuIdentitas,
              items: [
                {
                  "label": "Kartu Tanda Penduduk",
                  "value": "KTP",
                },
                {
                  "label": "Kartu BPJS",
                  "value": "BPJS",
                },
                {
                  "label": "Kartu KIS",
                  "value": "KIS",
                }
              ],
              onChanged: (value, label) {
                controller.jenisKartuIdentitas = value;
              },
            ),
            
              SizedBox(height: 40,),
              CustomTextInputField(
                maxLength: 20,
                isMustFilled: true,
                inputType: TextInputType.number,
                fillColor: FoundationViolet.violet1,
                validator: Validator.number,
                hintText: "Masukkan nomor NIK",
                headerIcon:  const Icon(
                  Icons.credit_card,
                  size: 20,
                  color: Style.secondary,
                ),
                headerText: Text("Nomor NIK",
                  style: GoogleFonts.poppins(
                    color: FoundationViolet.violet13,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  ),
                ),
                value: controller.nomorKartu,
                suffix: Container(
                  alignment: Alignment.center,
                  width: 63,
                  margin: EdgeInsetsDirectional.symmetric(vertical: 6, horizontal: 12),
                  child: Text("Cari",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Style.primary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
                onChanged: (value){
                  controller.nomorKartu = value;
                },
              ),
          ],
        )
      ),
    );
  }
}