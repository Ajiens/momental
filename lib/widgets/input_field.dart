import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/theme/color_pallete.dart';
import 'package:momental/widgets/icon_label.dart';

class CustomInputField extends StatelessWidget {
  final Widget headerIcon;
  final Text headerText;
  final bool isMustFilled;
  final TextInputType inputType;
  final Widget? prefix;
  final bool? isPassword;

  CustomInputField({
    Key? key,
    required this.headerIcon,
    required this.headerText,
    required this.isMustFilled,
    required this.inputType,
    this.prefix,
    this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              headerIcon,
              SizedBox(width: 8,),
              headerText,
              Spacer(),
              if (isMustFilled) Text("*Wajib diisi",
                                      style: GoogleFonts.poppins(
                                        color: Style.warningRed,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                      ),
              )
            ],
          ),
          SizedBox(height: 8,),
          TextFormField(
              // TODO: tambahin Controller
            keyboardType: inputType,
            obscureText: isPassword??false,
            decoration: InputDecoration(
              filled: true,
              fillColor: FoundationViolet.violet5,
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              prefix: prefix,
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}