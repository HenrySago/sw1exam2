import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }
}
