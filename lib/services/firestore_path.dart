class FirestorePath {
  static String user(String userUid) => 'Users/$userUid';

  static String Orders() => 'Orders';

  static String order(String orderName) => Orders() + '/' + orderName;

  static String order_config() => 'OrderConfig';

  static String order_create_form() =>
      order_config() + '/order_create_form';
}
