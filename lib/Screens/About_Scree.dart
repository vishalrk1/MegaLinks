import 'package:flutter/material.dart';
import 'package:onikiri_ui/Widgets/AppDrawer.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routName = '/about-page';

  final String _igLink1 = 'https://www.instagram.com/megalinks.official/';
  final String _igLink2 = 'https://www.instagram.com/editor_dragon/';
  final String _igLink3 = 'https://www.instagram.com/am_aep/';
  final String _dcLink = 'https://discord.com/invite/PjfJsh9ty3';

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
                        Colors.purpleAccent[100]!,
                        Colors.transparent,
                      ]),
                ),
                child: Image.asset(
                  'assets/AboutHeader.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, right: 5, left: 10, bottom: 5),
                  child: Text(
                    """Mega Link is a Editing stuff app .. which is developed by Vishal & Abhijit             
Make your edit Better with our ScenePacks , Project Files , Editing tutorial
We provide you all necessary Editing Stuff & Requirements which will help you to make a better edit within Less time

Be part of the movement! Mega Link, is the first  pro editing stuff app for your smartphone, Bringing you professional Quality  full Hd Scenepacks, One of the best animation & editing tutorial , Overlays and many more.

Content used is provided with the permission of creators or submitted by users.""",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    'Upcoming Updates',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '1. Overlays section',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '3. Audio Section',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    'Social Media',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Text(
                          'Instagram',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "MegaLink's instagram page",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset('assets/SMlogo/instagram.png'),
                        ),
                        tileColor: Colors.white,
                        onTap: () {
                          UrlLauncher().launchInBrowser(_igLink1);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Text(
                          'Instagram',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'developer:- Am_aep',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset('assets/SMlogo/instagram.png'),
                        ),
                        tileColor: Colors.white,
                        onTap: () {
                          UrlLauncher().launchInBrowser(_igLink2);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Text(
                          'Instagram',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'developer:- Editor_dragon',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset('assets/SMlogo/instagram.png'),
                        ),
                        tileColor: Colors.white,
                        onTap: () {
                          UrlLauncher().launchInBrowser(_igLink3);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: Text(
                    'Discord Server',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
// Discord Server Card..............................................................................................
                Card(
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
                            child: Image.asset(
                              'assets/discord.png',
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
// Get Link button....................................................................................................................
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {
                                UrlLauncher().launchInBrowser(_dcLink);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              color: Colors.amber[200],
                              child: Text(
                                'Join Now',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 50),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
