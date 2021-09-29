import 'dart:ffi';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/helpers/SearchBar.dart';
import 'package:onikiri_ui/models/ScenePack_model.dart';
import 'package:provider/provider.dart';

import '../models/Category.dart';
import '../Widgets/AppDrawer.dart';
import '../Scene_Packs/scenePack_card.dart';

class ScenePackScren extends StatefulWidget {
  static const routeName = '/scenepack-page';

  final heroTag;
  final title;

  ScenePackScren({
    this.heroTag,
    this.title,
  });

  @override
  _ScenePackScrenState createState() => _ScenePackScrenState();
}

class _ScenePackScrenState extends State<ScenePackScren> {
  Future<void> getScenePackData() async {
    await Provider.of<DataProvider>(context, listen: false).getScenePack();
  }

  getTitleList(List<ScenePackModel> spList) {
    Provider.of<DataProvider>(context, listen: false).getTitleList(spList);
  }

  @override
  Widget build(BuildContext context) {
    final Category loadedData =
        ModalRoute.of(context).settings.arguments as Category;

    List<ScenePackModel> spList =
        Provider.of<DataProvider>(context).scenePackList;
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE), //Color(0xFF7A9BEE)
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                getTitleList(spList);
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height - 40.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent),
          Positioned(
            top: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.purple[50]), // Colors.purple[50]
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: (MediaQuery.of(context).size.width / 2) - 140,
            child: Row(
              children: [
                Hero(
                  tag: loadedData.title, //widget.heroTag
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 5),
                        image: DecorationImage(
                            image: AssetImage(loadedData.image),
                            fit: BoxFit.cover),
                      ),
                      height: 70.0,
                      width: 70.0),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  loadedData.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.135,
            left: 15.0,
            right: 15.0,
            child: Container(
              padding: EdgeInsets.only(bottom: 30),
              height: MediaQuery.of(context).size.height * 0.800,
              child: dataProvider.isLoding
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : LiveList.options(
                      itemCount: spList.length,
                      options: LiveOptions(
                        showItemInterval: Duration(
                          milliseconds: 100,
                        ),
                      ),
                      itemBuilder: (ctx, index, animation) => FadeTransition(
                        opacity:
                            Tween<double>(begin: 0, end: 1).animate(animation),
                        child: ScenePackCard(
                          scenePack: spList[index],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
