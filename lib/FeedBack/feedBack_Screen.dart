import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/FeedBack/User_feedBack_Screen.dart';
import 'package:onikiri_ui/HomePage/homePage_screen.dart';
import 'package:onikiri_ui/Widgets/AppDrawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBackScreen extends StatefulWidget {
  static const routName = '/feedback-page';

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final _nameFocusNode = FocusNode();
  final _feedbackFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _isLoading = false;

  Map<String, dynamic> data = {
    'name': '',
    'feedback': '',
    'bug': '',
  };

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _feedbackFocusNode.dispose();
    super.dispose();
  }

  late CollectionReference _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseFirestore.instance.collection('Feedback');
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    _ref.add(data).then(
      (value) {
        // Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Submited successfully'),
            content: Text("""Thank you for Your Feedback"""),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomePageScreen.routeName);
                  },
                  child: Text('Okay'))
            ],
          ),
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getFeedBackData() async {
    await Provider.of<DataProvider>(context, listen: false).getFeedbacks();
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
                        Colors.purpleAccent[100]!,
                        Colors.transparent,
                      ]),
                ),
                child: Image.asset(
                  'assets/FeedbackHeader.jpg',
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
                    """Give your valuable feedBack so that we can improve our app""",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                ListTile(
                  // ignore: deprecated_member_use
                  trailing: RaisedButton(
                    child: Text(
                      " Read FeedBacks",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.blue[900],
                    onPressed: () {
                      getFeedBackData();
                      Navigator.of(context)
                          .pushNamed(UserFeedBackScreen.routName);
                    },
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
// text fields........................................................................................................
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            'Submit FeedBack',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
// first text field.......................................................................................................
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_nameFocusNode);
                          },
                          onSaved: (value) {
                            data['name'] = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Entre Something';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
// Second text field.......................................................................................................
                        TextFormField(
                          decoration: InputDecoration(labelText: 'FeedBack'),
                          textInputAction: TextInputAction.next,
                          focusNode: _nameFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_feedbackFocusNode);
                          },
                          onSaved: (value) {
                            data['feedback'] = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Entre Something';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
// third text field.......................................................................................................
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Report Bug'),
                          textInputAction: TextInputAction.next,
                          focusNode: _feedbackFocusNode,
                          onSaved: (value) {
                            data['bug'] = value;
                          },
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 50),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            color: Colors.amber[200],
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            onPressed: () {
                              // Navigator.of(context).pop();
                              _saveForm();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
