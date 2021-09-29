import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/Scene_Packs/scenePack_card.dart';
import 'package:onikiri_ui/models/ScenePack_model.dart';
import 'package:provider/provider.dart';

class DataSearch extends SearchDelegate<String> {
  List recentSearch = [
    "Jennie",
    "Hannah Baker",
    "Cristiano Ronaldo",
    "charli d'amelio",
  ];

// first override
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

// second override
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

// third override
  @override
  Widget buildResults(BuildContext context) {
    List<ScenePackModel> spList =
        Provider.of<DataProvider>(context).scenePackList;
    int index = spList.indexWhere((element) => element.title == query);
    return index >= 0
        ? Center(
            child: Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ScenePackCard(
                  scenePack: spList[index],
                ),
              ),
            ),
          )
        : Center(
            child: Text("Start Searching"),
          );
  }

// fourth override
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> titleList = Provider.of<DataProvider>(context).titleList;
    final suggestionList = query.isEmpty
        ? recentSearch
        : titleList.where((sp) {
            final titleLower = sp.toLowerCase();
            final queryLower = query.toLowerCase();

            return titleLower.startsWith(queryLower);
          }).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
          leading: Icon(Icons.star),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
