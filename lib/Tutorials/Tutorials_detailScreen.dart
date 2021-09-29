import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:provider/provider.dart';

import '../models/Category.dart';
import '../Widgets/AppDrawer.dart';
import 'package:onikiri_ui/Tutorials/tutorialCard.dart';
import 'package:onikiri_ui/models/TutorialModel.dart';

enum FilterOptions {
  Ae,
  Svp,
  Am,
}

class TutorialsScren extends StatefulWidget {
  static const routeName = '/tutorials-page';

  @override
  _TutorialsScrenState createState() => _TutorialsScrenState();
}

class _TutorialsScrenState extends State<TutorialsScren> {
  String _typeSelected = 'After Effects';

  Future<void> getTutorials(String category) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getTutorials(software: category);
  }

  @override
  Widget build(BuildContext context) {
    final Category loadedData =
        ModalRoute.of(context).settings.arguments as Category;
    final dataProvider = Provider.of<DataProvider>(context);
    List<TutorialModel> tutList =
        Provider.of<DataProvider>(context).tutorialsList;

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
        title: Text(_typeSelected,
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (String selectedvalue) {
                setState(() {
                  _typeSelected = selectedvalue;
                });
                getTutorials(_typeSelected);
                print(_typeSelected);
              },
              icon: Icon(Icons.filter_alt),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('After Effects'),
                      value: 'After Effects',
                    ),
                    PopupMenuItem(
                      child: Text('Sony Vegas Pro'),
                      value: 'Sony Vegas Pro',
                    ),
                    PopupMenuItem(
                      child: Text('Alight Motion'),
                      value: 'Alight Motion',
                    ),
                  ]),
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
              top: 5.0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: Colors.purple[50]),
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width)),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: (MediaQuery.of(context).size.width / 2) - 150,
            child: Row(
              children: [
                Hero(
                  tag: loadedData.title, //widget.heroTag
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(
                            image: AssetImage(loadedData.image),
                            fit: BoxFit.cover),
                      ),
                      height: 70.0,
                      width: 70.0),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  loadedData.title,
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
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: MediaQuery.of(context).size.height * 0.800,
                  child: dataProvider.isLoding
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : LiveList.options(
                          itemCount: tutList.length,
                          options: LiveOptions(
                            showItemInterval: Duration(
                              milliseconds: 100,
                            ),
                          ),
                          itemBuilder: (ctx, index, animation) =>
                              FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1)
                                .animate(animation),
                            child: TutorialCard(
                              tutorial: tutList[index],
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
