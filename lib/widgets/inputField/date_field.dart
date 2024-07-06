import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constant/color_pallete.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    required this.headerText,
    required this.onChanged,
    required this.isMustFilled,
    super.key,
    this.headerIcon,
    this.value,
    this.validator,
  });
  final Text headerText;
  final bool isMustFilled;
  final Widget? headerIcon;
  final DateTime? value;
  final String? Function(String?)? validator;
  final Function(DateTime) onChanged;

  @override
  State<DateInputField> createState() => _QDatePickerState();
}

class _QDatePickerState extends State<DateInputField> {
  DateTime? selectedValue;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  String getInitialValue() {
    if (widget.value != null) {
      return DateFormat('d MMM y').format(widget.value!);
    }
    return 'Pilih Tanggal';
  }

  String getFormattedValue() {
    if (selectedValue != null) {
      return DateFormat('d MMMM y').format(selectedValue!);
    }
    return '-';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              widget.headerIcon??
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
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: widget.value ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              selectedValue = pickedDate;
              controller.text = getFormattedValue();
              setState(() {});
          
              if (selectedValue == null) return;
              widget.onChanged(selectedValue!);
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller,
                style: GoogleFonts.poppins(
                  color: (selectedValue == null)
                    ?FoundationViolet.violet7
                    :FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: (selectedValue == null)
                    ?FontWeight.normal
                    :FontWeight.w600,
                ),
                validator: (value) {
                  if (widget.validator != null) {
                    return widget.validator!(selectedValue.toString());
                  }
                  return null;
                },
                readOnly: true,
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  fillColor: FoundationViolet.violet1,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  suffixIcon: const Icon(
                    Icons.date_range,
                    size: 20,
                    color: FoundationViolet.violet7,
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
