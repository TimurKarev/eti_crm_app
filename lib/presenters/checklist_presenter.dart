import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/services/cloud_firebase_service.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class ChecklistPresenter {
  FormModel model;

  ChecklistPresenter({FormModel model}) {
    this.model = model;
    _rebuildModel();
  }

  void _rebuildModel() {
    for (var s = 0; s < model.sectionsNumber; s++) {
      var section = model.getSectionByIndex(s);
      bool isBreak = false;
      for (var p = 0; p < model.getPointsNumberInSection(s); p++) {
        final point = model.getSectionPointByIndex(s, p);
        if (point['value'] == 'unchecked' || point['value'] == 'comment') {
          section['approved'] = false;
          isBreak = true;
          break;
        }
      }
      if (!isBreak) {
        section['approved'] = false;
      }
    }
  }

  String get orderNum => model.model['order']; //TODO: refactor model

  String get type => model.model['type']; //TODO: refactor model

  String get barTitle => model.pageTitle;

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

  void updateCommentByIndex(int s, int p, String value) {
    model.setPointCommentByIndex(s, p, value);
  }
}
