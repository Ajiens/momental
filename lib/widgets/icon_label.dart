import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class IconLabel extends StatefulWidget {
  final String beforeIconAsset;
  final String afterIconAsset;
  final Widget? labelIcon;

  IconLabel({
    Key? key,
    required this.beforeIconAsset,
    required this.afterIconAsset,
    this.labelIcon,
  }) : super(key: key);

  @override
  _IconLabelState createState() => _IconLabelState();
}

class _IconLabelState extends State<IconLabel> {
  bool _isBefore = true;

  void _toggleIcon() {
    setState(() {
      _isBefore = !_isBefore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleIcon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(_isBefore ? widget.beforeIconAsset : widget.afterIconAsset),
          SizedBox(width: 4,),
          if (widget.labelIcon != null) widget.labelIcon!,
        ],
      ),
    );
  }
}