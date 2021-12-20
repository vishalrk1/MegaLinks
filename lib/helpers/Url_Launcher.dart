import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_parser/youtube_parser.dart';

class UrlLauncher {
  Future<void> launchInBrowser(String url) async {
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

//   // extracting youtube videos id
//   convertUrlToId({required String url, bool trimWhitespaces = true}) {
//     assert(url.isNotEmpty, 'Url cannot be empty');
//     if (!url.contains("http") && (url.length == 11)) return url;
//     if (trimWhitespaces) url = url.trim();

//     for (var exp in [
//       RegExp(
//           r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
//       RegExp(
//           r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
//       RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
//     ]) {
//       RegExpMatch? match = exp.firstMatch(url);
//       if (match != null && match.groupCount >= 1) return match.group(1);
//     }

//     return null;
//   }
// }

  // extracting youtube videos id
  convertUrlToId({required String url}) {
    String? videoId = getIdFromUrl(url);
    return videoId;
  }
}
