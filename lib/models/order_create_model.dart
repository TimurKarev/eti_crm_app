class OrderCreateModel {
  final Map<String, dynamic> _model;

  String get pageTitle => _model['headers']['title'];

  int get sectionsNumber => _model['sections'].length;

  int getPointsNumberInSection(int indSec) => _model['sections'][indSec]['points'].length;

  String getSectionLabelByIndex(int index) {
    return _model['sections'][index]['label'];
  }

  Map<String, dynamic> getSectionPointByIndex(int indSec, int indPoint) {
    Map<String, dynamic> result =
        _model['sections'][indSec]['points'][indPoint];
    if (result['type'] == 'choice') {
      result['choices'] =
          getChoiceVariantsByStringIndex(result['variants_index']);
    }
    return result;
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
