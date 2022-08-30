import 'package:permission_handler/permission_handler.dart';

///Función para verificar el permiso deseado, si no lo tiene, lo solicita y
///regresa ese resultado
///```
/// final PermissionStatus status = await permission.status;
/// if (status.isDenied) {
///   final result = await permission.request().isGranted;
///   return result;
/// }
/// return true;
///```
Future<bool> getPermission(Permission permission) async {
  final PermissionStatus status = await permission.status;
  if (status.isDenied) {
    final result = await permission.request().isGranted;
    return result;
  }
  return true;
}
