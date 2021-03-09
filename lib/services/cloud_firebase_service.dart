import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CloudFirebaseService {
  Stream<Map<String, List<String>>> collectionGroupStream(
      {@required String collectionGroup, @required String field}) {
    final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
        .collectionGroup(collectionGroup)
        .orderBy(field)
        .snapshots();

    return snapshots.map((snaps) {
      Map<String, List<String>> result = {};
      snaps.docs.forEach((element) {
        final valElem = element.id.toString();
        final key = element.get('order');
        if (!result.containsKey(key)) {
          final List<String> firstValue = [valElem];
          result[key] = firstValue;
        } else {
          result[element.get('order')].add(element.id.toString());
        }
      });
      return result;
    });
  }

  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Future<Map<String, dynamic>> getDocument({String path}) async {
    final reference = FirebaseFirestore.instance.doc(path).get();
    return reference.then((value) => value.data());
  }

}

