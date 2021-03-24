import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/services/firestore_path.dart';

class OrderPresenter {
  FormModel model;

  OrderPresenter({this.model});

  String get orderNum {
    return model.model['order'] == null
        ? model.firstElementValue
        : model.model['order'];
  }

  String get type => model.model['type']; //TODO: refactor model

  int get sectionsNumber => model.sectionsNumber;

  String getSectionLabelByIndex(sIndex) => model.getSectionLabelByIndex(sIndex);

  int getPointsNumberInSection(sIndex) =>
      model.getPointsNumberInSection(sIndex);

  Map<String, dynamic> getSectionPointByIndex(sIndex, pIndex) =>
      model.getSectionPointByIndex(sIndex, pIndex);

  List<dynamic> getChoiceVariantsByStringIndex(String pointIndex) =>
      model.getChoiceVariantsByStringIndex(pointIndex);

  String getPointValueByStringIndex(String pointIndex, String value) =>
      model.getChoiceLabelByPointIndexAndValue(pointIndex, value);

  Future<void> saveOrder(CloudFirebaseService firebase) async {
    await firebase.setDocument(
        path: FirestorePath.order(orderNum), data: model.model);
  }

  Future<void> createOrder(CloudFirebaseService firebase) async {
    final orderList =
        await firebase.getCollection(path: FirestorePath.Orders());
    final newOrderNum = model.firstElementValue;
    if (orderList.contains(newOrderNum)) {
      throw 'Данный номер заказа уже существует';
    }
    print("order NUM  " + newOrderNum);
    model.model['order'] = newOrderNum;
    model.model['headers']['substation_type'] =
        model.getSectionPointByIndex(0, 1)['value'];
    model.model['sections'].removeAt(0);
    await firebase.setDocument(
        path: FirestorePath.order(newOrderNum), data: model.model);
  }
}
