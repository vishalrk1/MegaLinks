// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YtPlayer extends StatefulWidget {
//   final String title;
//   final String videoLink;
//   final String pfLink;

//   YtPlayer(
//       {required this.title, required this.videoLink, required this.pfLink});

//   @override
//   _YtPlayerState createState() => _YtPlayerState();
// }

// class _YtPlayerState extends State<YtPlayer> {
//   late Future<void> _launched;
//   String _phone = '';

//   // launching any url.............................................................................
//   Future<void> _launchInBrowser(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'header_key': 'header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String? videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       elevation: 8,
//       margin: EdgeInsets.all(10),
//       child: Column(
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//                 child: YoutubePlayer(
//                   controller: YoutubePlayerController(
//                       initialVideoId: videoId!,
//                       flags: YoutubePlayerFlags(
//                         autoPlay: false,
//                       )),
//                   showVideoProgressIndicator: true,
//                   aspectRatio: 16 / 9,
//                   progressIndicatorColor: Colors.blue,
//                   progressColors: ProgressBarColors(
//                       playedColor: Colors.blue, handleColor: Colors.blueAccent),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 // // first row = duration symob

//                 Text(
//                   widget.title,
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 18,
//                   ),
//                 ),

//                 SizedBox(
//                   height: 10,
//                 ),
// // Get Link button....................................................................................................................
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                   onPressed: () {
//                     _launchInBrowser('${widget.pfLink}');
//                   },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(18.0),
//                   ),
//                   color: Colors.amber[200],
//                   child: Text(
//                     'Project File',
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
