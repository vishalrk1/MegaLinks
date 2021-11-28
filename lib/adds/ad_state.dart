import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  var noClicks = 0;
  var noPfClicks = 0;

  String get scenePackSubmitionBannerAdUnitId =>
      ""; //ca-app-pub-9593982606370172/1434621898
  String get submittutorialBannerAdUnitId =>
      ""; //ca-app-pub-9593982606370172/9282457791
  String get animeRawSubmitionBannerAdUitId =>
      ""; //ca-app-pub-9593982606370172/2525477754
  String get homePageBannerAdUnit =>
      ""; //ca-app-pub-9593982606370172/4414178452

  String get scenePackfullScreenAdUnitId =>
      ""; //ca-app-pub-9593982606370172/7586232749
  String get projectFileScreenAdUnit =>
      ""; //ca-app-pub-9593982606370172/4383416539
//ca-app-pub-4498385082552578/7308896539
  String get scenePackSubmitionAdUnit =>
      ""; //ca-app-pub-9593982606370172/4304347291 ca-app-pub-4498385082552578/8908725143

  String get tutorialSubmitionAdUnit =>
      "ca-app-pub-4498385082552578/8908725143"; //ca-app-pub-9593982606370172/5408463835

  final BannerAdListener adListener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );
}
