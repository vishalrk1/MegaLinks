import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:onikiri_ui/models/TutorialModel.dart';
import 'package:provider/provider.dart';

class TutorialCard extends StatefulWidget {
  final TutorialModel tutorial;

  TutorialCard({this.tutorial});
  @override
  _TutorialCardState createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {
  @override
  Widget build(BuildContext context) {
    final String videoId =
        UrlLauncher().convertUrlToId(url: widget.tutorial.link);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 310,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/0.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 5),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.tutorial.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),

                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          UrlLauncher().launchInBrowser(widget.tutorial.link);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        color: Colors.amber[200],
                        child: Text(
                          'Watch Full Video',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
