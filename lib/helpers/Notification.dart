  // final Dio dio = Dio();
  // var _downloading = true;
  // var progress;
  // final String url =
  //     //   "https://mega.nz/file/XoF2wBwQ#tdHv7aJoe9_34chQDeeA8Kks3Cl5MiD-uDV9vE7ouMg";
  //     "https://firebasestorage.googleapis.com/v0/b/editing-app-de1f1.appspot.com/o/pfVideos%2FWoopty-%20Rashmika.mp4?alt=media&token=70263134-6d3e-4547-870f-3179e8b62851";

  // Future<Directory> downloadsDirectory =
  //     DownloadsPathProvider.downloadsDirectory;

  // final errorSnackBar = SnackBar(
  //   content: Text('Download Failed!!.. Please restart and try again'),
  // );

  // final downloadSuccessfullSnackBar = SnackBar(
  //   content: Text('Download SucessFull!!... Check your downloades'),
  // );

  // Future<bool> saveVideo(String url, String fileName) async {
  //   if (await _requestPermission(Permission.storage)) {
  //     Directory directory;
  //     directory = await DownloadsPathProvider.downloadsDirectory;
  //     File saveFile = File(directory.path + "/$fileName");
  //     print(saveFile.path);
  //     await startDownload(saveFile.path, url);
  //     return true;
  //   }
  //   return false;
  // }

  // Future<bool> _requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // downloadFile(String fileUrl, String fileName) async {
  //   setState(() {
  //     _downloading = true;
  //     progress = 0;
  //   });
  //   bool downloaded = await saveVideo(
  //     fileUrl,
  //     fileName,
  //   );
  //   if (downloaded) {
  //     print("File Downloaded");
  //     ScaffoldMessenger.of(context).showSnackBar(downloadSuccessfullSnackBar);
  //   } else {
  //     print("Problem Downloading File");
  //     ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
  //   }
  // }

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // Future startDownload(String savePath, String urlPath) async {
  //   Map<String, dynamic> result = {
  //     "isSuccess": false,
  //     "filePath": null,
  //     "error": null
  //   };
  //   try {
  //     var response = await dio.download(urlPath, savePath);
  //     result['isSuccess'] = response.statusCode == 200;
  //     result['filePath'] = savePath;
  //   } catch (e) {
  //     result['error'] = e.toString();
  //   } finally {
  //     setState(() {
  //       _downloading = false;
  //     });
  //     _showNotification(result);
  //   }
  // }

  // Future _showNotification(Map<String, dynamic> downloadStatus) async {
  //   final andorid = AndroidNotificationDetails(
  //       "channelId", 'GTU Students', 'channelDescription',
  //       priority: Priority.high, importance: Importance.max);
  //   final ios = IOSNotificationDetails();
  //   final notificationDetails = NotificationDetails(android: andorid, iOS: ios);
  //   final json = jsonEncode(downloadStatus);
  //   final isSuccess = downloadStatus['isSuccess'];
  //   await FlutterLocalNotificationsPlugin().show(
  //       0,
  //       isSuccess ? "Sucess" : "error",
  //       isSuccess ? "File Download Successful " : "File Download Faild",
  //       notificationDetails,
  //       payload: json);
  // }

  // Future<dynamic> _onselectedNotification(String json) async {
  //   final obj = jsonDecode(json);
  //   if (obj['isSuccess']) {
  //     OpenFile.open(obj['filePath']);
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               title: Text('Error'),
  //               content: Text(obj['error']),
  //             ));
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   final android = AndroidInitializationSettings('mipmap/ic_launcher');
  //   final ios = IOSInitializationSettings();
  //   final initSetting = InitializationSettings(android: android, iOS: ios);
  //   flutterLocalNotificationsPlugin.initialize(initSetting,
  //       onSelectNotification: _onselectedNotification);
  // }