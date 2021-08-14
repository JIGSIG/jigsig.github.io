import 'package:flutter/material.dart';

enum PersonSayDirection { LEFT, RIGHT }

enum DialogItemType { SIMPLETEXT, INTERACTIVETEXT }

class DialogItem {
  final String text;
  final DialogItemType dialogItemType;
  final Widget? person;
  final PersonSayDirection personSayDirection;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? background;
  final Widget? header;
  final Widget? bottom;
  final List<String>? choices;

  DialogItem({
    this.text = '',
    this.choices,
    this.personSayDirection = PersonSayDirection.LEFT,
    this.dialogItemType = DialogItemType.SIMPLETEXT,
    this.textStyle,
    this.boxDecoration,
    this.padding,
    this.margin,
    this.person,
    this.background,
    this.header,
    this.bottom,
  });
}
