import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onikiri_ui/Input%20Screens/ProjectFile_Submission_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Input%20Screens/AnimeData_Submition_Form.dart';
import '../Input%20Screens/ScenePack_Submition_Form.dart';
import '../Input%20Screens/Tutorial_submition_form.dart';
import '../Widgets/AppDrawer.dart';
import '../helpers/custom_rout1.dart';

class DataSubmitScreen extends StatefulWidget {
  static const routName = '/data-submition';

  @override
  _DataSubmitScreenState createState() => _DataSubmitScreenState();
}

class _DataSubmitScreenState extends State<DataSubmitScreen> {
  final String _igLink1 = 'https://www.instagram.com/megalinks.official/';

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
    return Scaffold(
      backgroundColor: Colors.purple[50],
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: Text('ONIKIRI',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.purple[50],
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'MEGA LINKS',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: <Color>[
                        Colors.purpleAccent[100],
                        Colors.transparent,
                      ]),
                ),
                child: Image.asset(
                  'assets/aquaHeader.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    """Submit your own Scene Packs, Anime Raw link and Tutorials to get featured in the app and help us to get more data""",
                    style: TextStyle(
                        // fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.grey[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Submit Scene Packs',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('Character name, link required'),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(CustomRoute(
                                builder: (ctx) => ScenePackSubmitionScreen()));
                          },
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[50],
                  child: ListTile(
                    title: Text(
                      'Submit Tutorial links',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('channel name, youtube link required'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(CustomRoute(
                            builder: (ctx) => TutorialSubmitionScreen()));
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[50],
                  child: ListTile(
                    title: Text(
                      'Submit Anime Scenes/Raw links',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('link required'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(CustomRoute(
                            builder: (ctx) => AnimeDataSubmitionScreen()));
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[50],
                  child: ListTile(
                    title: Text(
                      'Submit Project Files',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('link required'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(CustomRoute(
                            builder: (ctx) => PfSubmissionScreen()));
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
