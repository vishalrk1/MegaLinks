import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/Widgets/AppDrawer.dart';
import 'package:onikiri_ui/helpers/Submit_Sucessful_Dialog.dart';

class PackRequestScreen extends StatefulWidget {
  static const routName = '/packrRequest-page';

  @override
  _PackRequestScreenState createState() => _PackRequestScreenState();
}

class _PackRequestScreenState extends State<PackRequestScreen> {
  final _nameFocusNode = FocusNode();
  final _feedbackFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _isLoading = false;

  Map<String, dynamic> data = {
    'characterName': '',
    'seriesName': '',
    'name': '',
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
    _ref = FirebaseFirestore.instance.collection('PackRequest');
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
          builder: (ctx) => SubmitedAlertDialog(),
          barrierDismissible: false,
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
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
                  'assets/RequestHeader.jpg',
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
                    """Tell us which scene packs we should add more""",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
                            'Submit Request',
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
                          decoration:
                              InputDecoration(labelText: 'Characte Name'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_nameFocusNode);
                          },
                          onSaved: (value) {
                            data['characterName'] = value;
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
                          decoration:
                              InputDecoration(labelText: 'Series/Movie Name'),
                          textInputAction: TextInputAction.next,
                          focusNode: _nameFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_feedbackFocusNode);
                          },
                          onSaved: (value) {
                            data['seriesName'] = value;
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
                          decoration:
                              InputDecoration(labelText: 'Your ig/name'),
                          textInputAction: TextInputAction.next,
                          focusNode: _feedbackFocusNode,
                          onSaved: (value) {
                            data['name'] = value;
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
