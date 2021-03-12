import 'package:eti_crm_app/mvp/edit_form_state.dart';
import 'package:eti_crm_app/mvp/form_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editFormPresenterProvider =
    Provider((ref) => EditFormPresenter(ref.read));

final editFormPresenterModelReadyProvider = FutureProvider.autoDispose
    .family<void, String>(
        (ref, path) => ref.read(editFormPresenterProvider).getModel(path));

class EditFormPresenter extends StateNotifier<EditFormState> {
  final Reader read;

  FormModel _model = FormModel();

  EditFormPresenter(this.read) : super(EditFormState());

  Future<void> getModel(String path) async {
    final _data = await read(cloudFirebaseServiceProvider)
        .getDocument(path: FirestorePath.order_create_form());
    _model.model = _data;

    if (_model.model.isEmpty) {
      throw 'Не получается загрузить данные из Базы Данных ';
    }
  }

  Future<bool> _isOrderExist() async {
    var orders = read(orderListStreamProvider).data.value;

    if (orders.contains(_model.orderName)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveDocument() async {
    bool isOrderExist = await _isOrderExist();
    if (!isOrderExist) {
      await read(cloudFirebaseServiceProvider).setDocument(
          path: FirestorePath.order(_model.orderName), data: _model.data);
    } else {}
  }

  void update(int s, int c, String value) {
    _model.setPointValueByIndex(s, c, value);
    //print(_model.getSectionPointByIndex(s, c));
  }

  String get titleText => _model.pageTitle;

  int get sectionsNumber => _model.sectionsNumber;

  String getSectionLabelByIndex(sIndex) =>
      _model.getSectionLabelByIndex(sIndex);

  int getPointsNumberInSection(sIndex) =>
      _model.getPointsNumberInSection(sIndex);

  Map<String, dynamic> getSectionPointByIndex(sIndex, pIndex) =>
      _model.getSectionPointByIndex(sIndex, pIndex);

  List<dynamic> getChoiceVariantsByStringIndex(String pointIndex) => _model.getChoiceVariantsByStringIndex(pointIndex);
}
