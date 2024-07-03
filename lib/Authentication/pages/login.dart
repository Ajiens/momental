import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/Authentication/controller/login_controller.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/constant/validator.dart';
import 'package:momental/state_util.dart';
import 'package:momental/widgets/inputField/text_field.dart';

import '../../DataDiri/pages/data_diri.dart';
import '../../widgets/button.dart';
import '../../widgets/navbar.dart';
import '../../widgets/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
  State<Login> createState() => LoginFormController();

  Widget build(BuildContext context, LoginFormController controller) {
    controller.view = this;
    return Padding(
      padding: EdgeInsets.fromLTRB(28, 20, 28, 40),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 8,
                width: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: FoundationViolet.violet5,
                ),
              ),
            ),
            SizedBox(height: 40,),
            CustomTextInputField(
              isMustFilled: true,
              inputType: TextInputType.emailAddress,
              validator: Validator.email,
              headerIcon:  const Icon(
                Icons.email_rounded,
                size: 20,
                color: Style.secondary,
              ),
              headerText: Text("Email",
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
              isMustFilled: true,
              isPassword: true,
              inputType: TextInputType.emailAddress,
              validator: Validator.required,
              headerIcon:  const Icon(
                Icons.lock_rounded,
                size: 20,
                color: Style.secondary,
              ),
              headerText: Text("Password",
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
                await controller.doLogin().then((response){
                  if (response["status"]){
                    Navigator.pushReplacement(Get.currentContext,
                        MaterialPageRoute(builder: (context) => DataDiri()));
                  }
                  else{
                    showToast(type: "Error", message: response["message"]);
                  }
                  controller.formKey.currentState?.reset();
                });
              }
            ),
          ]
        ),
      ),
    );
  }
}