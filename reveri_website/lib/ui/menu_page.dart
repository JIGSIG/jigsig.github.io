import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:reveri_website/ui/common/app_background.dart';
import 'package:reveri_website/ui/common/horizontal_tab_layout.dart';
import 'package:reveri_website/ui/styleguide/text_styles.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(16, 16, 17, 1),
      body: Stack(
        children: <Widget>[
          FloatingSearchBar(
            width: platformIsWeb ? 400 : null,
            transitionCurve: Curves.easeInOutCubic,
            transition: CircularFloatingSearchBarTransition(),
            physics: const BouncingScrollPhysics(),
            onQueryChanged: (value) => searchController.text = value,
            builder: (context, _) => Container(),
          ),
          Center(
            child: HorizontalTabLayout(
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }
}
