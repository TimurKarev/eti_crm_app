import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/services/firestore_path.dart';

class OrderPresenter {
  FormModel model;

  OrderPresenter({this.model});

  String get orderNum => model.model['order']; //TODO: refactor model

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

  Future<void> saveChecklist(CloudFirebaseService firebase) async {
    await firebase.setDocument(
        path: FirestorePath.checklist(orderNum: orderNum, type: type),
        data: model.model);
  }
}
