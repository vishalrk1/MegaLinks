import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/Widgets/AppDrawer.dart';
import 'package:onikiri_ui/models/AnimeModel.dart';
import 'package:provider/provider.dart';

import '../models/Category.dart';
import 'Anime_InfoCard.dart';

class AnimeRawDetailsPage extends StatefulWidget {
  static const routeName = '/animedetails-page';

  @override
  _AnimeRawDetailsPageState createState() => _AnimeRawDetailsPageState();
}

class _AnimeRawDetailsPageState extends State<AnimeRawDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Category loadedData =
        ModalRoute.of(context)!.settings.arguments as Category;
    final dataProvider = Provider.of<DataProvider>(context);
    final List<AnimeModel> rawList =
        Provider.of<DataProvider>(context).animeRawList;

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
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Stack(
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
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.purple[50]),
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
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
                top: MediaQuery.of(context).size.height * 0.160,
                left: 15.0,
                right: 15.0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  height: MediaQuery.of(context).size.height * 0.760,
                  child: dataProvider.isLoding
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : LiveList.options(
                          itemCount: rawList.length,
                          options: LiveOptions(
                            showItemInterval: Duration(
                              milliseconds: 100,
                            ),
                          ),
                          itemBuilder: (ctx, index, animation) =>
                              FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1)
                                .animate(animation),
                            child: AnimeRawInfoCard(
                              animeRaw: rawList[index],
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
