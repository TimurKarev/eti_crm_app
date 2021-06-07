import 'package:eti_crm_app/models/const/four_point_const.dart';
import 'package:flutter/foundation.dart';

class FormModel {
  Map<String, dynamic> model;

  FormModel({this.model});

  // FormModel([this._model]);
  // set data( Map<String, dynamic> model) => _model = model;

  Map<String, dynamic> get data => model;

  String get pageTitle => model['headers']['title'];

  String get firstElementValue => model['sections'][0]['points'][0]['value'];

  int get sectionsNumber => model['sections'].length;

  Map<String, dynamic> getSectionByIndex(int index) {
    return model['sections'][index];
  }

  int getPointsNumberInSection(int indSec) =>
      model['sections'][indSec]['points'].length;

  String getSectionLabelByIndex(int index) {
    return model['sections'][index]['label'];
  }

  Map<String, dynamic> getSectionPointByIndex(int indSec, int indPoint) {
    Map<String, dynamic> result = model['sections'][indSec]['points'][indPoint];
    return result;
  }

  void setPointValueByIndex(int indSec, int indPoint, String value) {
    model['sections'][indSec]['points'][indPoint]['value'] = value;
  }

  void setPointCommentByIndex(int indSec, int indPoint, String value) {
    try {
      model['sections'][indSec]['points'][indPoint]['comment'] = value;
    } finally {}
  }

  List<dynamic> getChoiceVariantsByStringIndex(String pointIndex) {
    List<dynamic> result = [];
    final List<dynamic> config = model['config'];
    for (var conf in config) {
      if (conf.containsKey('choice_variants')) {
        if (conf['choice_variants'].containsKey(pointIndex)) {
          result = conf['choice_variants'][pointIndex];
          break;
        }
      }
    }
    if (result.isEmpty) {
      throw 'No such value';
    }
    return result;
  }

  String getChoiceLabelByPointIndexAndValue(String pointIndex, String value) {
    final variants = getChoiceVariantsByStringIndex(pointIndex);
    for (var variant in variants) {
      if (variant['value'] == value) {
        return variant['label'].toString();
      }
    }
    return 'непонятка';
  }

  String getPointValueByStringIndex(String strIndex) {
    for (var s = 0; s < sectionsNumber; s++) {
      for (var p = 0; p < getPointsNumberInSection(s); p++) {
        final point = getSectionPointByIndex(s, p);
        if (point.containsKey('index')) {
          if (point['index'] == strIndex) return point['value'];
        }
      }
    }
    return '0';
  }

  Map<String, int> getIndexesDict() {
    Map<String, int> dict = {};
    for (var s = 0; s < sectionsNumber; s++) {
      for (var p = 0; p < getPointsNumberInSection(s); p++) {
        final point = getSectionPointByIndex(s, p);
        if (point.containsKey('index')) {
          try {
            if ((point['index'] == 'kso_num') && (int.parse(point['value']) >= 1)) {
              dict['is_kso'] = 1;
              dict['kso_num'] = int.parse(point['value']);
            } else {
              var value = int.parse(point['value']);
              dict[point['index']] = value;
            }
          } catch (e) {
            dict[point['index']] = 0;
          }
        }
      }
    }
    return dict;
  }

  String getSectionStatusByIndex(int secInd) {
    String result = FourPointValues.APPROVED;
    final section = getSectionByIndex(secInd);
    for (var point in section['points']) {
      if (point['value'] == FourPointValues.COMMENT) {
        return FourPointValues.COMMENT;
      }
      if (point['value'] == FourPointValues.UNCHECKED) {
        result = FourPointValues.UNCHECKED;
      }
    }
    return result;
  }

  void rebuildModelFromDict(
      {@required Map<String, int> dict,
      @required String order,
      @required String type}) {
    Map<String, dynamic> newModel = {};
    List<dynamic> newSections = [];
    final List<dynamic> sections = model['sections'];
    sections.forEach((section) {
      final index = section['order_config_index'];
      if (index == null) {
        newSections.add(section);
      } else {
        final int sectionQuantity = dict[index] ?? 0;
        final label = section['label'];
        for (var i = 0; i < sectionQuantity; i++) {
          final n = sectionQuantity > 1 ? ' N${i + 1}' : '';
          Map curSec = {...section};
          curSec['label'] = label + n;
          newSections.add(curSec);
        }
      }
    });
    newModel['sections'] = newSections;
    newModel['order'] = order;
    newModel['type'] = type;
    newModel['config'] = model['config'];
    newModel['headers'] = {'title': _getChecklistTitle(order, type)};
    model = newModel;
  }

  String _getChecklistTitle(String order, String type) {
    if (type == 'bm_checklist')
      return 'Чеклист строительной части. Заказ №$order';
    if (type == 'el_checklist')
      return 'Чеклист электрики. Заказ №$order';
    if (type == 'doc_checklist')
      return 'Чеклист документации. Заказ №$order';
    return null;
  }
}
