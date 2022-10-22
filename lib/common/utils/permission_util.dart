import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {

  ///检查是否有权限
  ///[permissions] 权限
  ///return 是否有权限
  static checkPermissions(List<Permission> permissions,{VoidCallback? onSuccess, VoidCallback? onFailed, VoidCallback? onSetting}) async {
    List<Permission> newList = [];
    ///遍历当前权限申请列表
    for (Permission permission in permissions) {
      PermissionStatus status = await permission.status;
      ///如果不是允许状态就添加到新的申请列表中
      if (!status.isGranted) {
        newList.add(permission);
      }
    }
    ///如果需要重新申请的列表不是空的
    if (newList.isNotEmpty) {
      PermissionStatus permissionStatus = await _requestPermission(newList);
      switch (permissionStatus) {
        ///拒绝状态
        case PermissionStatus.denied:
          if(onFailed != null) {
            onFailed();
          }
          break;
        ///允许状态
        case PermissionStatus.granted:
          if(onSuccess != null) {
            onSuccess();
          }
          break;
        /// 永久拒绝  活动限制
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
          if(onSetting != null) {
            onSetting();
          }
          break;
      }
    } else {
      if(onSuccess != null) {
        onSuccess();
      }
    }
  }

  static Future<PermissionStatus> _requestPermission(List<Permission> permissions) async{
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }


  // 一个需要特殊处理的权限 ios获取checkLocationAlways 这个权限时候需要先获取 locationWhenInUse 在获取locationAlways 所以封装了以下
  static checkLocationAlways({VoidCallback? onSuccess, VoidCallback? onFailed, VoidCallback? onSetting}) async{
    ///获取前置状态
    /// Android没有这一步 ios会先访问这个再访问其他的
    PermissionStatus status = PermissionStatus.granted;
    status = await _checkSinglePermission(Permission.locationWhenInUse);
    ///获取第二个状态
    PermissionStatus status2 = PermissionStatus.denied;
    ///如果前置状态为成功才能执行获取第二个状态
    if (status.isGranted) {
      status2 = await _checkSinglePermission(Permission.locationAlways);
    }
    ///如果两个都成功那么就返回成功
    if (status.isGranted && status2.isGranted) {
      if(onSuccess != null) {
        onSuccess();
      }
      ///如果有一个拒绝那么就失败了
    } else if (status.isDenied || status2.isDenied) {
      if(onFailed != null) {
        onFailed();
      }
    } else {
      if(onSetting != null) {
        onSetting();
      }
    }
  }

  static Future<PermissionStatus> _checkSinglePermission(Permission permission) async {
    ///获取当前状态
    PermissionStatus status = await permission.status;
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    ///如果它状态不是允许那么就去获取
    if (!status.isGranted) {
      currentPermissionStatus = await _requestPermission([permission]);
    }
    ///返回最终状态
    return currentPermissionStatus;
  }

  // /// 启动时请求权限
  // static Future<String> applyLaunchPermission() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.location,
  //     Permission.storage,
  //     Permission.camera,
  //     if (Global.isIOS) Permission.photos,
  //   ].request();
  //   return statuses.toString();
  // }
  //
  // static Future<bool> location() async {
  //   if (await Permission.location.serviceStatus != ServiceStatus.enabled) {
  //     throw ("位置服务未打开");
  //   }
  //   await Permission.location.request();
  //   if (await Permission.location.isGranted) {
  //     return true;
  //   } else if (await Permission.location.isDenied) {
  //     await Permission.location.request();
  //     if (await Permission.location.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了位置授权");
  //     }
  //   } else if (await Permission.locationWhenInUse.isPermanentlyDenied) {
  //     throw ("您拒绝了位置授权，请在设置中打开");
  //   } else {
  //     throw ("位置授权未知错误");
  //   }
  // }
  //
  // static Future<bool> camera() async {
  //   await Permission.camera.request();
  //   if (await Permission.camera.isGranted) {
  //     return true;
  //   } else if (await Permission.camera.isDenied) {
  //     await Permission.camera.request();
  //     if (await Permission.camera.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了相机授权");
  //     }
  //   } else if (await Permission.camera.isPermanentlyDenied) {
  //     throw ("您拒绝了相机授权，请在设置中打开");
  //   } else {
  //     throw ("相机授权未知错误");
  //   }
  // }
  //
  // static Future<bool> microphone() async {
  //   await Permission.microphone.request();
  //   if (await Permission.microphone.isGranted) {
  //     return true;
  //   } else if (await Permission.microphone.isDenied) {
  //     await Permission.microphone.request();
  //     if (await Permission.microphone.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了麦克风授权");
  //     }
  //   } else if (await Permission.microphone.isPermanentlyDenied) {
  //     throw ("您拒绝了麦克风授权，请在设置中打开");
  //   } else {
  //     throw ("麦克风授权未知错误");
  //   }
  // }
  //
  // static Future<bool> storage() async {
  //   await Permission.storage.request();
  //   if (await Permission.storage.isGranted) {
  //     return true;
  //   } else if (await Permission.storage.isDenied) {
  //     await Permission.storage.request();
  //     if (await Permission.storage.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了文件存储授权");
  //     }
  //   } else if (await Permission.storage.isPermanentlyDenied) {
  //     throw ("您拒绝了文件存储授权，请在设置中打开");
  //   } else {
  //     throw ("文件存储授权未知错误");
  //   }
  // }
  //
  // static Future<bool> photos() async {
  //   await Permission.photos.request();
  //   if (await Permission.photos.isGranted) {
  //     return true;
  //   } else if (await Permission.photos.isDenied) {
  //     await Permission.photos.request();
  //     if (await Permission.photos.isGranted) {
  //       return true;
  //     } else {
  //       throw ("您取消了相册授权");
  //     }
  //   } else if (await Permission.photos.isPermanentlyDenied) {
  //     throw ("您拒绝了相册授权，请在设置中打开");
  //   } else {
  //     throw ("相册授权未知错误");
  //   }
  // }
  //
  // /// 定位适用用
  // static Future<bool> locationPermissionRequest() async {
  //   return await location();
  // }
  //
  // /// 拍视频适用
  // static Future<bool> videoPermissionRequest() async {
  //   return await camera() && await microphone() && await storage() && await photos();
  // }
  //
  // /// 拍照片适用
  // static Future<bool> cameraPermissionRequest() async {
  //   return await camera() && await storage() && await photos();
  // }
  //
  // /// 扫描适用
  // static Future<bool> qrCodePermissionRequest() async {
  //   return await camera();
  // }
  //
  // /// 上传下载适用
  // static Future<bool> filePermissionRequest() async {
  //   return await storage() && await photos();
  // }
}