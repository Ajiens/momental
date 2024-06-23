import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/theme/color_pallete.dart';
import 'package:momental/widgets/button.dart';
import 'package:momental/widgets/input_field.dart';
import 'package:momental/widgets/navbar.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: FoundationViolet.violet7
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Selesaikan Pendaftaran",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: FoundationViolet.violet13
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 45),
          child: Column(
            children: [
              inputRegisterField(),
              Spacer(),
              CustomButton(
                label: Text("Lanjutkan",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16
                  ),
                ),
                color: Style.primary, //TODO: Berubah warna kalau antara text controller kosong/keisi 
                tapFunction: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navbar()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputRegisterField(){
    return Column(
      children: [
        CustomInputField(
          isMustFilled: true,
          inputType: TextInputType.phone,
          headerIcon: const Icon(
            Icons.phone,
            size: 20,
            color: Style.secondary,
          ),
          headerText: Text("Nomor Telepon",
            style: GoogleFonts.poppins(
              color: FoundationViolet.violet13,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
          prefix: Text(" +62  |  "),
        ),

        SizedBox(height: 20,),
        CustomInputField(
          isMustFilled: true,
          inputType: TextInputType.emailAddress,
          headerIcon: const Icon(
            Icons.email_rounded,
            size: 20,
            color: Style.secondary,
          ),
          headerText: Text("Alamat Email",
            style: GoogleFonts.poppins(
              color: FoundationViolet.violet13,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
        ),

        SizedBox(height: 20,),
        CustomInputField(
          isMustFilled: true,
          isPassword: true,
          inputType: TextInputType.text,
          headerIcon: const Icon(
            Icons.lock_rounded,
            size: 20,
            color: Style.secondary,
          ),
          headerText: Text("Kata Sandi",
            style: GoogleFonts.poppins(
              color: FoundationViolet.violet13,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
        ),

        SizedBox(height: 20,),
        CustomInputField(
          isMustFilled: true,
          isPassword: true,
          inputType: TextInputType.text,
          headerIcon: const Icon(
            Icons.lock_rounded,
            size: 20,
            color: Style.secondary,
          ),
          headerText: Text("Konfirmasi Kata Sandi",
            style: GoogleFonts.poppins(
              color: FoundationViolet.violet13,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ],
    );
  }
}