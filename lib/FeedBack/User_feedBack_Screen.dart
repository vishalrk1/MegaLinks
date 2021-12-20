import 'package:auto_animated/auto_animated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/models/FeedBack_Model.dart';
import 'package:provider/provider.dart';

class UserFeedBackScreen extends StatefulWidget {
  static const routName = '/user-feedback';
  @override
  _UserFeedBackScreenState createState() => _UserFeedBackScreenState();
}

class _UserFeedBackScreenState extends State<UserFeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final List<FeedBackModel> feedbackList =
        Provider.of<DataProvider>(context).feedBacksList;
    return Scaffold(
      backgroundColor: Colors.purple[50], //Color(0xFF7A9BEE)
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF7A9BEE),
        title: Text('User FeedBacks',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: dataProvider.isLoding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : LiveList.options(
              itemCount: feedbackList.length,
              options: LiveOptions(
                showItemInterval: Duration(
                  milliseconds: 100,
                ),
              ),
              itemBuilder: (ctx, index, animation) => FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: FeedBackCard(
                  name: feedbackList[index].name,
                  feedback: feedbackList[index].feedBack,
                ),
              ),
            ),
    );
  }
}

class FeedBackCard extends StatelessWidget {
  final String feedback;
  final String name;

  FeedBackCard({required this.feedback, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListTile(
              title: Text(
                feedback,
                style: GoogleFonts.libreFranklin(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "- $name",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
        ));
  }
}
