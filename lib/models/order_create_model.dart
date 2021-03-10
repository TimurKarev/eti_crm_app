class OrderCreateModel {
  final Map<String, dynamic> _model;

  Map<String, dynamic> get data => _model;

  String get pageTitle => _model['headers']['title'];

  String get orderName => _model['sections'][0]['points'][0]['value'];

  int get sectionsNumber => _model['sections'].length;

  int getPointsNumberInSection(int indSec) => _model['sections'][indSec]['points'].length;

  String getSectionLabelByIndex(int index) {
    return _model['sections'][index]['label'];
  }

  Map<String, dynamic> getSectionPointByIndex(int indSec, int indPoint) {
    Map<String, dynamic> result =
        _model['sections'][indSec]['points'][indPoint];
    return result;
  }

  void setPointValueByIndex(int indSec, int indPoint, String value) {
    _model['sections'][indSec]['points'][indPoint]['value'] = value;
  }

  List<dynamic> getChoiceVariantsByStringIndex(String pointIndex) {
    List<dynamic> result = [];
    final List<dynamic> config = _model['config'];
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

  OrderCreateModel(this._model);
}
