import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Authentication/controller/register_controller.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/constant/validator.dart';
import 'package:momental/widgets/button.dart';
import 'package:momental/widgets/inputField/text_field.dart';
import 'package:momental/widgets/navbar.dart';

import '../../state_util.dart';
import '../../widgets/toast.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  
  @override
  State<Register> createState() => RegisterFormController();

  Widget build(BuildContext context, RegisterFormController controller) {
    controller.view = this;
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
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomTextInputField(
                      maxLength: 20,
                      isMustFilled: true,
                      fillColor: FoundationViolet.violet5,
                      inputType: TextInputType.phone,
                      prefix: Text(" +62  |  "),
                      validator: Validator.noTelpon,
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
                      onChanged: (value){
                        controller.noTelpon = value;
                      },
                    ),
                
                    SizedBox(height: 20,),
                    CustomTextInputField(
                      maxLength: 256,
                      isMustFilled: true,
                      fillColor: FoundationViolet.violet5,
                      inputType: TextInputType.emailAddress,
                      validator: Validator.email,
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
                      onChanged: (value){
                        controller.email = value;
                      },
                    ),
                
                    SizedBox(height: 20,),
                    CustomTextInputField(
                      maxLength: 50,
                      fillColor: FoundationViolet.violet5,
                      isMustFilled: true,
                      isPassword: true,
                      inputType: TextInputType.text,
                      validator: Validator.required,
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
                      onChanged: (value){
                        controller.password = value;
                      },
                    ),
                
                    SizedBox(height: 20,),
                    CustomTextInputField(
                      maxLength: 50,
                      fillColor: FoundationViolet.violet5,
                      isMustFilled: true,
                      isPassword: true,
                      inputType: TextInputType.text,
                      validator: (value) => Validator.matchingValue(value, controller.password),
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
                      onChanged: (value){
                        controller.password2 = value;
                      },
                    ),
                  ],
                ),
              ),
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
                tapFunction: () async {
                  await controller.doRegister().then((response){
                    if (response["status"]){
                      Navigator.pushReplacement(Get.currentContext,
                          MaterialPageRoute(builder: (context) => Navbar()));
                    }
                    if (response["message"] != ""){
                      showToast(type: "Error", message: response["message"]);
                    }
                    controller.formKey.currentState?.reset();
                  });
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}