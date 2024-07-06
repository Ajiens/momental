import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momental/constant/color_pallete.dart';

class RadioInputField extends StatefulWidget {
  const RadioInputField({
    required this.headerText,
    required this.isMustFilled,
    required this.items,
    required this.onChanged,
    super.key,
    this.headerIcon,
    this.validator,
    this.value,
  });

  final Text headerText;
  final bool isMustFilled;
  final Widget? headerIcon;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final Function(dynamic value, String? label) onChanged;
  final String? value;

  @override
  State<RadioInputField> createState() => _QRadioFieldState();
}

class _QRadioFieldState extends State<RadioInputField> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (final item in widget.items) {
      items.add(Map.from(item));
      if (items.last['value'] == widget.value) {
        items.last['checked'] = true;
      }
    }
  }

  setAllItemsToFalse() {
    for (final item in items) {
      item['checked'] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) => widget.validator!(items),
        builder: (FormFieldState<bool> field) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: items.map((item) {
                    final bool isSelected = item['checked'] ?? false;
                    return Expanded(
                      child: Container(
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
                            Radio(
                              groupValue: true,
                              value: isSelected,
                              onChanged: (val) {
                                setAllItemsToFalse();
                                final newValue = val! ? false : true;
                                items[items.indexOf(item)]['checked'] = newValue;
                                field.didChange(true);
                                setState(() {});
                            
                                final String? label = items[items.indexOf(item)]['label'];
                                final dynamic value = items[items.indexOf(item)]['value'];
                                print("VALUEEE $value ++++ $newValue");
                                widget.onChanged(value, label);
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
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
