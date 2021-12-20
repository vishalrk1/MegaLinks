import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/ProjectFile_Section/Project_file_Card.dart';
import 'package:onikiri_ui/models/PfModel.dart';
import 'package:provider/provider.dart';

import '../models/Category.dart';
import '../Widgets/AppDrawer.dart';

class FreePfScreen extends StatefulWidget {
  static const routeName = '/freepf-page';

  @override
  _FreePfScreenState createState() => _FreePfScreenState();
}

class _FreePfScreenState extends State<FreePfScreen> {
  String _typeSelected = 'After Effects';

  Future<void> getPfData({required String category}) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getProjectFileata(software: category);
  }

  @override
  Widget build(BuildContext context) {
    final Category loadedData = ModalRoute.of(context)!.settings.arguments
        as Category; // data passed through push routes
    final List<PfModel> pfList =
        Provider.of<DataProvider>(context).projectFileList;
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
                getPfData(category: _typeSelected);
                print(_typeSelected);
              },
              icon: Icon(Icons.more_horiz),
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
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent),
          Positioned(
              top: 20.0,
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
            top: MediaQuery.of(context).size.height * 0.05,
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
            top: MediaQuery.of(context).size.height * 0.170,
            left: 15.0,
            right: 15.0,
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 45),
                  height: MediaQuery.of(context).size.height * 0.800,
                  child: dataProvider.isLoding
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : LiveList.options(
                          itemCount: pfList.length,
                          options: LiveOptions(
                            showItemInterval: Duration(
                              milliseconds: 100,
                            ),
                          ),
                          itemBuilder: (ctx, index, animation) =>
                              FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1)
                                .animate(animation),
                            child: ProjectFileCard(
                              projectFile: pfList[index],
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
