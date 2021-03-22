import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CloudFirebaseService {
  Stream<List<String>> collectionStream({@required String path}) {
    Stream<QuerySnapshot> snapshot =
        FirebaseFirestore.instance.collection(path).snapshots();

    return snapshot.map((snap) {
      List<String> result = [];
      snap.docs.forEach((element) {
        result.add(element.id.toString());
      });
      return result;
    });
  }

  Future<List<String>> getCollection({@required path}) async {
    final orderReference = FirebaseFirestore.instance.collection(path).get();
    return orderReference.then((value) {
      List<String> result = [];
      value.docs.forEach((element) {
        result.add(element.id.toString());
      });
      return result;
    });
  }

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
        final key = element.get(field);
        if (!result.containsKey(key)) {
          final List<String> firstValue = [valElem];
          result[key] = firstValue;
        } else {
          result[element.get(field)].add(element.id.toString());
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

  Future<void> setDocument(
      {@required String path, @required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance.doc(path).set(data);
  }
}
