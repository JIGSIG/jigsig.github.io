import 'package:flutter/material.dart';
import 'package:reveri_website/ui/styleguide/text_styles.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String? text;
  final void Function() onTabTap;

  TabText({this.text, required this.isSelected, required this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: InkWell(
        onTap: onTabTap,
        child: AnimatedDefaultTextStyle(
          style: isSelected ? selectedTabStyle : defaultTabStyle,
          duration: const Duration(milliseconds: 500),
          child: Text(
            text!,
          ),
        ),
      ),
    );
  }
}
