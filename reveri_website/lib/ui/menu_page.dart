import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:reveri_website/ui/common/app_background.dart';
import 'package:reveri_website/ui/common/horizontal_tab_layout.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: <Widget>[
          AppBackground(),
          Container(color: Colors.black.withOpacity(.95),),
          FloatingSearchBar(
            transitionCurve: Curves.easeInOutCubic,
            transition: CircularFloatingSearchBarTransition(),
            physics: const BouncingScrollPhysics(),
            onQueryChanged: (value) => searchController.text = value,
            builder: (context, _) => Container(),
          ),
          Center(
            child: HorizontalTabLayout(searchController: searchController,),
          )
        ],
      ),
    );
  }
}

Widget buildBody() {
  final time = DateTime.now();
  print('BuildBody at ${time.second}:${time.millisecond}');
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Material(
      child: Column(
        children: List.generate(100, (index) => index.toString())
            .map((e) => ListTile(
          title: Text(e),
        ))
            .toList(),
      ),
    ),
  );
}