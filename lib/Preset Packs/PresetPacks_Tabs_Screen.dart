import 'package:flutter/material.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/Preset%20Packs/Free%20Preset%20Packs/Free_PresetPacks_Screen.dart';
import 'package:onikiri_ui/Preset%20Packs/Paid%20Preset%20packs/Paid_PresetPacks_Screen.dart';
import 'package:provider/provider.dart';

class PresetPackTabScreen extends StatefulWidget {
  static const routName = '/presetScreen-tab';

  @override
  _PresetPackTabScreenState createState() => _PresetPackTabScreenState();
}

class _PresetPackTabScreenState extends State<PresetPackTabScreen> {
  Future<void> getPresetPacks({required String category}) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getPresetData(category: category);
  }

  final List<Widget> _pages = [
    FreePresetPackScreen(),
    PaidPresetPackScreen(),
  ];

  final List<String> categoryList = ["Free", "Paid"];

  int _selectedPageIndex = 0;

  void _selectPage(
    int index,
  ) {
    setState(() {
      _selectedPageIndex = index;
    });
    getPresetPacks(category: categoryList[_selectedPageIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: ColorPrimaryDark,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Free Preset Pack"),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: "Paid Preset Pack",
          ),
        ],
      ),
    );
  }
}
