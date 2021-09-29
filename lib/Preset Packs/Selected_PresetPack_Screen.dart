import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/models/PresetPack_Model.dart';
import 'package:provider/provider.dart';

import 'Widgets/PresetInfo_Card.dart';

class SelectedPresetPackScreen extends StatefulWidget {
  static const routName = '/selectd-preset';

  @override
  _SelectedPresetPackScreenState createState() =>
      _SelectedPresetPackScreenState();
}

class _SelectedPresetPackScreenState extends State<SelectedPresetPackScreen> {
  BannerAd banner;

  // field for ad.....................................................................................
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState1 = Provider.of<AdState>(context);
    final adProvider = Provider.of<AdMob>(context);
    adState1.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adProvider.bannerAd,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState1.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final presetPack =
        ModalRoute.of(context).settings.arguments as PresetPackModel;
    final dataProvide = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.purple[50], //Color(0xFF7A9BEE)
      appBar: AppBar(
        title: Text(
          "Preset Packs",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        elevation: 5,
      ),
      body: dataProvide.isLoding
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Center(
                    child: Text(
                      "Enjoy your preset pack!!",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PreSetInfoCard(presetPack: presetPack),
                ),
                SizedBox(
                  height: 50,
                ),
                banner == null
                    ? SizedBox(
                        height: 50,
                      )
                    : Container(
                        height: 50,
                        child: AdWidget(
                          ad: banner,
                        ),
                      ),
              ],
            ),
    );
  }
}
