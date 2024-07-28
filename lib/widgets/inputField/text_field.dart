import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';

class CustomTextInputField extends StatefulWidget {
  final Widget headerIcon;
  final Text headerText;
  final bool isMustFilled;
  final TextInputType inputType;
  final Function(String) onChanged;
  final Color fillColor;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String? value;

  CustomTextInputField({
    Key? key,
    required this.headerIcon,
    required this.headerText,
    required this.fillColor,
    required this.isMustFilled,
    required this.inputType,
    required this.onChanged,
    this.hintText,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.validator,
    this.isPassword,
    this.value,
  }) : super(key: key);

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
    TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
            controller: textEditingController,
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
              fillColor: widget.fillColor,
              hintText: widget.hintText,
              suffixIcon: widget.suffix,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.prefix,
              ),
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: FoundationViolet.violet7,
                fontWeight: FontWeight.w400
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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