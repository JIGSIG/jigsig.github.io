import 'dart:async';

import 'package:bonfire/util/talk/say.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class TalkDialog extends StatefulWidget {
  const TalkDialog({
    Key? key,
    required this.dialogItems,
    this.finish,
    this.onChangeTalk,
    this.textBoxMinHeight = 100,
    this.keyboardKeyToNext,
    this.padding,
  }) : super(key: key);

  static Future<String?> show(
    BuildContext context,
    List<DialogItem> dialogItemList, {
    VoidCallback? finish,
    ValueChanged<int>? onChangeTalk,
    Color? backgroundColor,
    double boxTextHeight = 100,
    LogicalKeyboardKey? logicalKeyboardKeyToNext,
    EdgeInsetsGeometry? padding,
  }) async {
    return await showDialog(
      barrierColor: backgroundColor,
      context: context,
      builder: (BuildContext context) {
        return TalkDialog(
          dialogItems: dialogItemList,
          finish: finish,
          onChangeTalk: onChangeTalk,
          textBoxMinHeight: boxTextHeight,
          keyboardKeyToNext: logicalKeyboardKeyToNext,
          padding: padding,
        );
      },
    ) as String?;
  }

  final List<DialogItem> dialogItems;
  final VoidCallback? finish;
  final ValueChanged<int>? onChangeTalk;
  final double? textBoxMinHeight;
  final LogicalKeyboardKey? keyboardKeyToNext;
  final EdgeInsetsGeometry? padding;

  @override
  _TalkDialogState createState() => _TalkDialogState();
}

class _TalkDialogState extends State<TalkDialog> {
  final FocusNode _focusNode = FocusNode();
  Timer? timer;
  late DialogItem currentDialogItem;
  int currentIndexTalk = 0;
  int countLetter = 1;
  bool finishCurrentTalk = false;
  var widgetKey = GlobalKey();
  Size personSize = Size(100, 100);

  StreamController<String> _textShowController =
      StreamController<String>.broadcast();

  bool playerMadeChoice = false;

  String? choice;

  @override
  void initState() {
    currentDialogItem = widget.dialogItems[currentIndexTalk];
    startShowText();
    Future.delayed(Duration.zero, () {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _textShowController.close();
    _focusNode.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (raw) {
          if (currentDialogItem.dialogItemType == DialogItemType.SIMPLETEXT) {
            if (widget.keyboardKeyToNext == null && raw is RawKeyDownEvent) {
              _nextOrFinish();
            } else if (raw.logicalKey == widget.keyboardKeyToNext &&
                raw is RawKeyDownEvent) {
              _nextOrFinish();
            }
          } else {
            if (widget.keyboardKeyToNext == null && raw is RawKeyDownEvent) {
              _nextOrFinish();
              playerMadeChoice = false;
            } else if (raw.logicalKey == widget.keyboardKeyToNext &&
                raw is RawKeyDownEvent) {
              _nextOrFinish();
              playerMadeChoice = false;
            }
          }
        },
        child: GestureDetector(
          onTap: _nextOrFinish,
          child: Container(
            color: Colors.transparent,
            padding: widget.padding ?? EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: _getAlign(currentDialogItem.personSayDirection),
                  child: currentDialogItem.background ?? SizedBox.shrink(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ..._buildPerson(PersonSayDirection.LEFT),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          currentDialogItem.header ?? SizedBox.shrink(),
                          Container(
                            width: double.maxFinite,
                            padding:
                                currentDialogItem.padding ?? EdgeInsets.all(10),
                            margin: currentDialogItem.margin,
                            constraints: widget.textBoxMinHeight != null
                                ? BoxConstraints(
                                    minHeight: widget.textBoxMinHeight!,
                                  )
                                : null,
                            decoration: currentDialogItem.boxDecoration ??
                                BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                            child: Stack(
                              children: [
                                _dialogTextChild(),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: SizedBox(
                                    height: 1000,
                                    width: 100,
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          finishCurrentTalk
                                              ? 'Suivant'
                                              : 'Passer',
                                          style: currentDialogItem.textStyle?.copyWith(
                                                  color: (finishCurrentTalk &&
                                                          choice == null &&
                                                          DialogItemType.INTERACTIVETEXT ==
                                                              currentDialogItem
                                                                  .dialogItemType
                                                      ? currentDialogItem
                                                          .textStyle?.color
                                                          ?.withOpacity(.6)
                                                      : currentDialogItem.textStyle?.color ??
                                                          Colors.white)) ??
                                              TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ).copyWith(
                                                  color: (finishCurrentTalk &&
                                                          choice == null &&
                                                          DialogItemType.INTERACTIVETEXT ==
                                                              currentDialogItem
                                                                  .dialogItemType
                                                      ? Colors.white.withOpacity(.6)
                                                      : Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          currentDialogItem.bottom ?? SizedBox.shrink(),
                        ],
                      ),
                    ),
                    ..._buildPerson(PersonSayDirection.RIGHT),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _finishTalk() {
    timer?.cancel();
    _textShowController.add(currentDialogItem.text);
    countLetter = 1;
    finishCurrentTalk = true;
    setState(() {});
  }

  void _nextTalk() {
    currentIndexTalk++;
    if (currentIndexTalk < widget.dialogItems.length) {
      setState(() {
        finishCurrentTalk = false;
        currentDialogItem = widget.dialogItems[currentIndexTalk];
      });
      if (currentDialogItem.dialogItemType == DialogItemType.SIMPLETEXT)
        startShowText();
      if (widget.onChangeTalk != null)
        widget.onChangeTalk?.call(currentIndexTalk);
    } else {
      widget.finish?.call();
      Navigator.pop(context, choice);
    }
  }

  void startShowText() {
    if (currentDialogItem.text.isEmpty) return;
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      _textShowController.add(currentDialogItem.text.substring(0, countLetter));
      countLetter++;
      if (countLetter == currentDialogItem.text.length + 1) {
        timer.cancel();
        countLetter = 1;
        finishCurrentTalk = true;
      }
    });
  }

  void showChoiceText() {
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      _textShowController.add(currentDialogItem.text.substring(0, countLetter));
      countLetter++;
      if (countLetter == currentDialogItem.text.length + 1) {
        timer.cancel();
        countLetter = 1;
        finishCurrentTalk = true;
      }
    });
  }

  List<Widget> _buildPerson(PersonSayDirection direction) {
    if (currentDialogItem.personSayDirection == direction) {
      return [
        if (direction == PersonSayDirection.RIGHT &&
            currentDialogItem.person != null)
          SizedBox(
            width: (widget.padding ?? EdgeInsets.all(10)).horizontal / 2,
          ),
        currentDialogItem.person ?? SizedBox.shrink(),
        if (direction == PersonSayDirection.LEFT &&
            currentDialogItem.person != null)
          SizedBox(
            width: (widget.padding ?? EdgeInsets.all(10)).horizontal / 2,
          ),
      ];
    } else {
      return [];
    }
  }

  void _nextOrFinish() {
    if (finishCurrentTalk) {
      if (currentDialogItem.dialogItemType == DialogItemType.SIMPLETEXT)
        _nextTalk();
      else if (playerMadeChoice) _nextTalk();
    } else {
      _finishTalk();
    }
  }

  Alignment _getAlign(PersonSayDirection personDirection) {
    return personDirection == PersonSayDirection.LEFT
        ? Alignment.bottomLeft
        : Alignment.bottomRight;
  }

  Widget choiceWidget() {
    if (currentDialogItem.dialogItemType != DialogItemType.INTERACTIVETEXT ||
        !finishCurrentTalk) return Container();
    return Column(
      children: List<Widget>.generate(
        currentDialogItem.choices!.length,
        (index) => RadioListTile<String>(
          dense: true,
          title: Text(
            "${currentDialogItem.choices!.elementAt(index)[0].toUpperCase()}${currentDialogItem.choices!.elementAt(index).substring(1)}",
            style: currentDialogItem.textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
          ),
          toggleable: true,
          activeColor: currentDialogItem.textStyle?.color ?? Colors.white,
          value: currentDialogItem.choices!.elementAt(index),
          groupValue: choice,
          onChanged: (String? value) {
            setState(() {
              choice = value;
              if (value == null || value.isEmpty) {
                playerMadeChoice = false;
              } else {
                playerMadeChoice = true;
              }
            });
          },
        ),
      ),
    );
  }

  Widget textWidget(AsyncSnapshot<String> snapshot) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 200.0 - personSize.width,
          child: Text(
            snapshot.hasData ? (snapshot.data ?? '') : '',
            overflow: TextOverflow.clip,
            style: currentDialogItem.textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
          ),
        ),
      ],
    );
  }

  _dialogTextChild() {
    return StreamBuilder<String>(
      stream: _textShowController.stream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              if (currentDialogItem.text.isNotEmpty) textWidget(snapshot),
              choiceWidget(),
            ],
          ),
        );
      },
    );
  }
}

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChange;

  const WidgetSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
