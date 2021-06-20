import 'package:flutter/material.dart';
import 'package:reveri_website/main.dart';
import 'package:reveri_website/ui/styleguide/colors.dart';

final platformIsWeb = getOSInsideWeb() == 'Web';
final platformIsIos = getOSInsideWeb() == 'Ios';

final TextStyle valueTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
final TextStyle labelTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: Colors.grey,
);
final TextStyle whiteValueTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white);
final TextStyle whiteLabelTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: Colors.white,
);
final TextStyle rankStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: primaryColor,
);
final TextStyle selectedTabStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
final TextStyle defaultTabStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);
final TextStyle headingStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
final TextStyle subHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.blueGrey,
  fontWeight: FontWeight.bold,
);
final TextStyle buttonStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
final TextStyle forumNameTextStyle = TextStyle(
  color: platformIsWeb ? Colors.white : Colors.black,
  fontSize: platformIsWeb ? 18 : 20.0,
  fontWeight: platformIsWeb ? FontWeight.w800 : FontWeight.w600,
);
