import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/Preset%20Packs/Widgets/Preset_card.dart';
import 'package:provider/provider.dart';

import '../../Widgets/AppDrawer.dart';

class PaidPresetPackScreen extends StatefulWidget {
  static const routName = '/paid-preset';

  @override
  _PaidPresetPackScreenState createState() => _PaidPresetPackScreenState();
}

class _PaidPresetPackScreenState extends State<PaidPresetPackScreen> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final presetList = Provider.of<DataProvider>(context).presetList;
    return Scaffold(
      backgroundColor: Colors.purple[50], //Color(0xFF7A9BEE)
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF7A9BEE),
        elevation: 5,
        title: Text('Preset Packs',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: dataProvider.isLoding
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorPrimary,
                ),
              )
            : presetList.length == 0
                ? Center(
                    child: Text(
                      "Paid Presets are Not availabel yet!!",
                      style: TextStyle(fontSize: 16, color: bodyTextColor),
                    ),
                  )
                : LiveList.options(
                    itemCount: presetList.length,
                    options: LiveOptions(
                      showItemInterval: Duration(
                        milliseconds: 100,
                      ),
                    ),
                    itemBuilder: (ctx, index, animation) => FadeTransition(
                      opacity:
                          Tween<double>(begin: 0, end: 1).animate(animation),
                      child: PreSetCard(
                        preset: presetList[index],
                      ),
                    ),
                  ),
      ),
    );
  }
}
