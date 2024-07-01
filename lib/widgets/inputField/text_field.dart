import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';
import 'package:momental/widgets/icon_label.dart';

class CustomTextInputField extends StatefulWidget {
  final Widget headerIcon;
  final Text headerText;
  final bool isMustFilled;
  final TextInputType inputType;
  final Function(String) onChanged;
  final Widget? prefix;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool? isPassword;

  CustomTextInputField({
    Key? key,
    required this.headerIcon,
    required this.headerText,
    required this.isMustFilled,
    required this.inputType,
    required this.onChanged,
    this.prefix,
    this.maxLength,
    this.validator,
    this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              widget.headerIcon,
              SizedBox(width: 8,),
              widget.headerText,
              Spacer(),
              if (widget.isMustFilled) Text("*Wajib diisi",
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
            
            validator: widget.validator,
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            obscureText: widget.isPassword??false,
            onChanged: (value) {
              widget.onChanged(value);
            },
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: FoundationViolet.violet5,
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              prefix: widget.prefix,
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