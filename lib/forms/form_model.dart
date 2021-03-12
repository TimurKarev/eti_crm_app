class FormModel {
  Map<String, dynamic> model;

  // FormModel([this._model]);
  // set data( Map<String, dynamic> model) => _model = model;

  Map<String, dynamic> get data => model;

  String get pageTitle => model['headers']['title'];

  String get orderName => model['sections'][0]['points'][0]['value'];

  int get sectionsNumber => model['sections'].length;

  int getPointsNumberInSection(int indSec) =>
      model['sections'][indSec]['points'].length;

  String getSectionLabelByIndex(int index) {
    return model['sections'][index]['label'];
  }

  Map<String, dynamic> getSectionPointByIndex(int indSec, int indPoint) {
    Map<String, dynamic> result =
        model['sections'][indSec]['points'][indPoint];
    return result;
  }

  void setPointValueByIndex(int indSec, int indPoint, String value) {
    model['sections'][indSec]['points'][indPoint]['value'] = value;
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
}
