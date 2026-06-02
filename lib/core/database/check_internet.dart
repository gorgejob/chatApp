import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetStatus> get onStatusChanged; // لمراقبة النت لو قطع فجأة والمستخدم فاتح الأبليكيشن
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection internetConnection;

  NetworkInfoImpl({required this.internetConnection});

  // بتجيب حالة النت الحالية (مرة واحدة)
  @override
  Future<bool> get isConnected async => await internetConnection.hasInternetAccess;

  // Stream بيراقب النت طول ما الأبليكيشن شغال
  @override
  Stream<InternetStatus> get onStatusChanged => internetConnection.onStatusChange;
}