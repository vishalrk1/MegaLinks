import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/Widgets/WebView_Screen.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:onikiri_ui/models/PresetPack_Model.dart';

import '../../Colors.dart';
import 'Blue_Gradient_Button.dart';

class PreSetInfoCard extends StatelessWidget {
  const PreSetInfoCard({
    Key key,
    @required this.presetPack,
  }) : super(key: key);

  final PresetPackModel presetPack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      height: 370,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Center(
                  child: DefaultTextStyle(
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 21,
                        color: black,
                        fontWeight: FontWeight.w500),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          presetPack.packName,
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: black,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 16, color: black, fontWeight: FontWeight.w400),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Includes",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          presetPack.contains,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    BlueGredientButtom(
                      text: "Instagram",
                      onPressed: () {
                        print(presetPack.instagramId);
                        UrlLauncher()
                            .launchInBrowser(presetPack.instagramId.toString());
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    BlueGredientButtom(
                      text: "Preset Pack Link",
                      onPressed: () {
                        Navigator.of(context).pushNamed(WebViewScreen.routName,
                            arguments: presetPack.payhipLink.toString());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
