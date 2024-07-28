import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/state_util.dart';

import '../../constant/color_pallete.dart';

class DropDownInputField extends StatefulWidget {
  const DropDownInputField({
    required this.headerText,
    required this.isMustFilled,
    required this.items,
    required this.onChanged,
    required this.inputSugest,
    this.headerIcon,
    super.key,
    this.value,
    this.validator,
  });

  final Text headerText;
  final bool isMustFilled;
  final String inputSugest;
  final Widget? headerIcon;
  final List<Map<String, String>> items;
  final String? Function(Map<String, dynamic>? value)? validator;
  final String? value;
  final Function(dynamic value, String? label) onChanged;

  @override
  State<DropDownInputField> createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<DropDownInputField> {
  List<Map<String, dynamic>> items = [];
  Map<String, dynamic>? selectedValue;

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
     _controller.text = widget.inputSugest;
     _controller.addListener((){
      setState(() {});
     });
    items = [];

    for (final item in widget.items) {
      items.add(item);
      if (item['value'] == widget.value){
        selectedValue = item;
      }
    }
    if (selectedValue != null){
      _controller.text = selectedValue?['value'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              if(widget.headerIcon!=null)
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: widget.headerIcon,
              ),
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
          GestureDetector(
            onTap: () => modalBottom(),
            child: Container(
              child: TextFormField(
                enabled: false,
                enableSuggestions: true,
                controller: _controller,
                validator: (value) {
                  print(selectedValue);
                  if (widget.validator != null) {
                    if (widget.inputSugest == _controller.text) { //Empty input
                      return widget.validator!(null);
                    }
                    return widget.validator!(selectedValue); //Selected input
                  }
                  return null;
                },
                style: (widget.inputSugest != _controller.text)
                ? GoogleFonts.poppins(
                  color: FoundationViolet.violet13,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ):null,
                decoration: InputDecoration(
                  counterText: "",
                  suffixIcon:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Icon(Icons.keyboard_arrow_down_outlined, color: FoundationViolet.violet7,),
                  ),
                  filled: true,
                  fillColor: FoundationViolet.violet1,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Future modalBottom(){
    return showModalBottomSheet(
      context: Get.currentContext,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 296,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text("${widget.inputSugest}",
                textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: FoundationViolet.violet13,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: FoundationViolet.violet5,
                ),
                for (int i=0; i<items.length; i++)
                  GestureDetector(
                    onTap: () {
                      _controller.text = "${items[i]["value"]}";
                      widget.onChanged(items[i]["value"], "${items[i]["label"]}");
                      selectedValue = items[i];
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Text("${items[i]["label"]}",
                       style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: FoundationViolet.violet8,
                        fontSize: 16
                       ),
                      ),
                    ),
                  )
              ]
            ),
          )
        ),
      )
    );
  }
}
