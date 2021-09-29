// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../models/Category.dart';
// import '../Widgets/AppDrawer.dart';
// import '../providers/Tutorial_Links.dart';
// import '../Widgets/AudioCard.dart';

// class AudioScreen extends StatefulWidget {
//   static const routeName = '/audios-page';

//   // final heroTag;
//   // final title;
//   // final Details;
//   // //final List<Scource> avaibleRaws;

//   // AnimeRawDetailsPage({this.heroTag, this.title, this.Details});

//   @override
//   _AudioScreenState createState() => _AudioScreenState();
// }

// class _AudioScreenState extends State<AudioScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final Category loadedData =
//         ModalRoute.of(context).settings.arguments as Category;
//     final tutorialData = Provider.of<TutorialData>(context);
//     final tutorials = tutorialData
//         .tutorialList; // extracting all anime raw list using provider

//     return Scaffold(
//       backgroundColor: Color(0xFF7A9BEE), //Color(0xFF7A9BEE)

//       appBar: AppBar(
//         leading: Consumer<MyAudio>(
//           builder: (_, myAudioModel, child) => IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               myAudioModel.pauseAudio();
//             },
//             icon: Icon(Icons.arrow_back_ios),
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: Text('Details',
//             style: TextStyle(
//                 fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
//         centerTitle: true,
//         actions: <Widget>[
//           Builder(
//             builder: (context) => IconButton(
//               icon: new Icon(Icons.more_horiz),
//               onPressed: () => Scaffold.of(context).openDrawer(),
//             ),
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//       body: ListView(
//         children: [
//           Stack(
//             children: [
//               Container(
//                   height: MediaQuery.of(context).size.height - 50.0,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.transparent),
//               Positioned(
//                   top: 20.0,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50.0),
//                             topRight: Radius.circular(50.0),
//                           ),
//                           color: Colors.purple[50]),
//                       height: MediaQuery.of(context).size.height - 50.0,
//                       width: MediaQuery.of(context).size.width)),
//               Positioned(
//                 top: MediaQuery.of(context).size.height * 0.05,
//                 left: (MediaQuery.of(context).size.width / 2) - 110,
//                 child: Row(
//                   children: [
//                     Hero(
//                       tag: loadedData.title, //widget.heroTag
//                       child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.black, width: 2),
//                             image: DecorationImage(
//                                 image: AssetImage(loadedData.image),
//                                 fit: BoxFit.cover),
//                           ),
//                           height: 70.0,
//                           width: 70.0),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       loadedData.title,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 25.0,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height * 0.170,
//                 left: 15.0,
//                 right: 15.0,
//                 child: Wrap(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(bottom: 30),
//                       height: MediaQuery.of(context).size.height * 0.760,
//                       child: StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection("audios")
//                             .snapshots(),
//                         builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.data == null)
//                             return Center(child: CircularProgressIndicator());
//                           return ListView.builder(
//                             itemCount: snapshot.data.docs.length,
//                             itemBuilder: (ctx, index) {
//                               DocumentSnapshot doc = snapshot.data.docs[index];
//                               return AudioCard(
//                                 title: doc['title'],
//                                 url: doc['link'],
//                                 credit: doc['credit'],
//                                 audioId: doc.reference.id, // unique document id
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           )
//         ],
//       ),
//     );
//   }
// }
