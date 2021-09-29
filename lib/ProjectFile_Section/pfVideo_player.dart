import 'package:flutter/material.dart';
import 'package:onikiri_ui/ProjectFile_Section/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class PfVideoPlayer extends StatefulWidget {
  final String title;
  final String videoLink;
  final String pfLink;

  PfVideoPlayer({this.title, this.videoLink, this.pfLink});

  @override
  _PfVideoPlayerState createState() => _PfVideoPlayerState();
}

class _PfVideoPlayerState extends State<PfVideoPlayer> {
  Future<void> _launched;
  String _phone = '';
  VideoPlayerController VidController;

  @override
  void initState() {
    super.initState();
    VidController = VideoPlayerController.network(widget.videoLink)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => VidController.pause());
  }

  @override
  void dispose() {
    VidController.dispose();
    super.dispose();
  }

  // launching any url.............................................................................
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: VideoPlayerWidget(
                    controller: VidController,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // // first row = duration symob

                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
// Get Link button....................................................................................................................
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    _launchInBrowser('${widget.pfLink}');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  color: Colors.amber[200],
                  child: Text(
                    'Project File',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
