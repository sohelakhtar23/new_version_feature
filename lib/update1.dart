import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

class Update1 extends StatefulWidget {
  const Update1({Key? key}) : super(key: key);

  @override
  _Update1State createState() => _Update1State();
}

class _Update1State extends State<Update1> {
  @override
  void initState() {
    super.initState();

    final newVersion = NewVersion(
      iOSId: 'com.google.Vespa',
      androidId: 'io.github.x_wei.flutter_catalog',
    );

    // You can let the plugin handle fetching the status and showing a dialog,
    // or you can fetch the status and display your own dialog, or no dialog.
    const simpleBehavior = false;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());

      if (status.canUpdate) {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: 'Custom Title',
          dialogText: 'Custom Text',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
