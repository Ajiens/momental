import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';

class CheckInputField extends StatefulWidget {
  const CheckInputField({
    required this.headerText,
    required this.isMustFilled,
    required this.items,
    required this.onChanged,
    required this.isVertical,
    super.key,
    this.headerIcon,
    this.validator,
    this.value,
  });

  final Text headerText;
  final bool isMustFilled;
  final Widget? headerIcon;
  final bool isVertical;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final Function(List<Map<String, dynamic>> checkedMaps, List value) onChanged;
  final List? value;

  @override
  State<CheckInputField> createState() => _CheckInputField();
}

class _CheckInputField extends State<CheckInputField> {
  List<Map<String, dynamic>> items = [];

  String? errorText;

  @override
  void initState() {
    super.initState();
    for (final item in widget.items) {
      items.add(Map.from(item));
    }

    if (widget.value != null) {
      for (final item in widget.value!) {
        final itemValue = item['value'];
        final index = items.indexWhere((i) => i['value'] == itemValue);
        if (index == -1) continue;
        items[index]['checked'] = item['checked'];
      }
    }
  }

  bool isFilled(){
    for (final item in items){
      if (item['checked'] == true){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) {
          errorText = widget.validator!(items);
          return errorText;
        },
        builder: (FormFieldState<bool> field) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                widget.isVertical
                ? Column(
                    children: items.map((item) {
                      return checkButton(item, field);
                    }).toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: items.map((item) {
                      return Expanded(child: checkButton(item, field));
                    }).toList(),
                  ),
                if (errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Text(
                      errorText!,
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget checkButton(Map<String, dynamic> item, FormFieldState<bool> field){
    final bool isSelected = item['checked'] ?? false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color:FoundationViolet.violet1,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: FoundationRed.light_active, width: 4)
            : Border.all(color: Colors.transparent, width: 4),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (val) {
              field.didChange(true);
              items[items.indexOf(item)]['checked'] = val;
              setState(() {});

              final checkedMaps =
                  items.where((i) => i['checked'] == true).toList();
              final value = checkedMaps.map((e) => e['value']).toList();

              print("MAPS $checkedMaps");
              widget.onChanged(checkedMaps, value);
            },
            activeColor: BlueMarguerite.shade500,
          ),
          Expanded(
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
                "${item["label"]}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:FoundationViolet.violet10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
