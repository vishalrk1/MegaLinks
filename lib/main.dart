import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onikiri_ui/DataProvider/DataUploader.dart';
import 'package:onikiri_ui/Input%20Screens/ProjectFile_Submission_Screen.dart';
import 'package:onikiri_ui/Widgets/WebView_Screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';

import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../HomePage/homePage_screen.dart';
import '../AnimeRaw_links/AnimeRaw_detail_screen.dart';
import '../Scene_Packs/ScenePack_detailScreen.dart';
import '../Tutorials/Tutorials_detailScreen.dart';
import '../Input%20Screens/Tutorial_submition_form.dart';
import '../Input%20Screens/ScenePack_Submition_Form.dart';
import '../Input%20Screens/AnimeData_Submition_Form.dart';
import '../Screens/About_Scree.dart';
import '../Input%20Screens/SubmitData_Screen.dart';
import '../ProjectFile_Section/FreePf_Screen.dart';
import '../FeedBack/feedBack_Screen.dart';
import '../adds/ad_state.dart';
import '../DataProvider/DataProvider.dart';
import '../FeedBack/User_feedBack_Screen.dart';
import '../Pack%20Request%20Page/Request_Screen.dart';
import '../Preset%20Packs/Free%20Preset%20Packs/Free_PresetPacks_Screen.dart';
import '../Preset%20Packs/Paid%20Preset%20packs/Paid_PresetPacks_Screen.dart';
import '../Preset%20Packs/PresetPacks_Tabs_Screen.dart';
import '../Preset%20Packs/Selected_PresetPack_Screen.dart';

const int maxFailedLoadAttempts = 3;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// add plugin inilitization.............................................................................
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
// auto rotations off..................................................................................
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
// initializing fire store .............................................................................
  await Firebase.initializeApp();
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AdMob(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => DataUploadProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MegaLinks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageScreen(),
        routes: {
          HomePageScreen.routeName: (ctx) => HomePageScreen(),
          AnimeRawDetailsPage.routeName: (ctx) => AnimeRawDetailsPage(),
          ScenePackScren.routeName: (ctx) => ScenePackScren(),
          TutorialsScren.routeName: (ctx) => TutorialsScren(),
          DataSubmitScreen.routName: (ctx) => DataSubmitScreen(),
          FreePfScreen.routeName: (ctx) => FreePfScreen(),
          TutorialSubmitionScreen.routName: (ctx) => TutorialSubmitionScreen(),
          PackRequestScreen.routName: (ctx) => PackRequestScreen(),
          AboutScreen.routName: (ctx) => AboutScreen(),
          FeedBackScreen.routName: (ctx) => FeedBackScreen(),
          UserFeedBackScreen.routName: (ctx) => UserFeedBackScreen(),
          FreePresetPackScreen.routName: (ctx) => FreePresetPackScreen(),
          PaidPresetPackScreen.routName: (ctx) => PaidPresetPackScreen(),
          PresetPackTabScreen.routName: (ctx) => PresetPackTabScreen(),
          WebViewScreen.routName: (ctx) => WebViewScreen(),
          SelectedPresetPackScreen.routName: (ctx) =>
              SelectedPresetPackScreen(),
          ScenePackSubmitionScreen.routName: (ctx) =>
              ScenePackSubmitionScreen(),
          AnimeDataSubmitionScreen.routName: (ctx) =>
              AnimeDataSubmitionScreen(),
          PfSubmissionScreen.routName: (ctx) => PfSubmissionScreen(),
        },
      ),
    );
  }
}
