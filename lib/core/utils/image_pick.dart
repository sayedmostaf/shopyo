import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopyo/core/di/injection_container.dart';

class PickImageUtils {
  factory PickImageUtils() {
    return _instance;
  }
  const PickImageUtils._();
  static const PickImageUtils _instance = PickImageUtils._();
  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        await _showAlertPermissionDialog();
      } else {
        debugPrint('Image Exception ==> $e');
      }
    }
    return null;
  }

  Future<void> _showAlertPermissionDialog() {
    return showCupertinoDialog(
      context: sl<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Permissions Denied'),
          content: Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
