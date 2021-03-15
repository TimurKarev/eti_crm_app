import 'package:flutter/foundation.dart';

class FirestorePath {
  static String user(String userUid) => 'Users/$userUid';

  static String Orders() => 'Orders';

  static String order(String orderName) => Orders() + '/' + orderName;

  static String order_config() => 'Config/order';

  static String order_create_form() =>
      order_config() + '/Forms/order_create_form';

  static String checklist_pattern(String type) =>
      '/Config/checklists/create_patterns/$type';

  static String checklist({@required String orderNum, @required String type}) =>
      Orders() + '/$orderNum/Checklists/$type';
}
