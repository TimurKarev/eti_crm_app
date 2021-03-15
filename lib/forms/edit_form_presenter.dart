import 'package:eti_crm_app/forms/edit_form_state.dart';
import 'package:eti_crm_app/forms/form_model.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/services/firestore_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editFormPresenterProvider =
    Provider<EditFormPresenter>((ref) => EditFormPresenter(ref.read));

final editFormPresenterModelReadyProvider = FutureProvider.autoDispose
    .family<void, String>(
        (ref, path) => ref.read(editFormPresenterProvider).initPresenter(path));

final editFormStateNotifier =
    ChangeNotifierProvider((ref) => ref.read(editFormPresenterProvider));

class EditFormPresenter extends ChangeNotifier {
  final Reader read;

  FormModel model = FormModel();
  EditFormState state;

  EditFormPresenter(this.read);

  Future<void> initPresenter(String path) async {
    final _data =
        await read(cloudFirebaseServiceProvider).getDocument(path: path);
    model.model = _data;
    _initState();
    if (model.model.isEmpty) {
      throw 'Не получается загрузить данные из Базы Данных ';
    }
  }

  void _initState() {
    state = EditFormState();
    if (model.model.containsKey('order')) {
      state.action = EditFormState.ACTION_EDIT;
    } else {
      state.action = EditFormState.ACTION_CREATE;
    }
    print('state ' + state.action);
  }

  Future<bool> _isOrderExist() async {
    var orders = read(orderListStreamProvider).data.value;
    //print('is order exist');
    if (orders.contains(model.firstElementValue)) {
      //print('True');
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveDocument() async {
    if (state.action == EditFormState.ACTION_EDIT) {
      await writeToCloudFirestore();
    } else {
      bool isOrderExist = await _isOrderExist();
      if (!isOrderExist) {
        _alterModelForSaving();
        await writeToCloudFirestore();
      } else {
        state.isOrderExistError = true;
        state.errorMessage =
            'Заказ с таким номером существует, введите уникальный номер';
        notifyListeners();
        throw 'Order exist exception';
      }
    }
  }

  Future writeToCloudFirestore() async {
    await read(cloudFirebaseServiceProvider)
        .setDocument(path: FirestorePath.order(orderNumber), data: model.data);
  }

  void _alterModelForSaving() {
    // Заменить заголовок листа
    if (state.action == EditFormState.ACTION_CREATE) {
      model.model['order'] = orderNumber;
      model.model['headers']['title'] =
          'Конфигурация заказа №${model.firstElementValue}';
      model.model['headers']['substation_type'] =
          model.getSectionPointByIndex(0, 1)['value'];

      model.model['sections'].removeAt(0);
      state.action = EditFormState.ACTION_AFTER_ALTERING;
    }
  }

  void update(int s, int c, String value) {
    model.setPointValueByIndex(s, c, value);
    //print(_model.getSectionPointByIndex(s, c));
  }

  String get orderNumber {
    if (state.action == EditFormState.ACTION_CREATE) {
      return model.firstElementValue;
    }
    return model.model['order'];
  }

  String get titleText => model.pageTitle;

  int get sectionsNumber => model.sectionsNumber;

  String getSectionLabelByIndex(sIndex) => model.getSectionLabelByIndex(sIndex);

  int getPointsNumberInSection(sIndex) =>
      model.getPointsNumberInSection(sIndex);

  Map<String, dynamic> getSectionPointByIndex(sIndex, pIndex) =>
      model.getSectionPointByIndex(sIndex, pIndex);

  List<dynamic> getChoiceVariantsByStringIndex(String pointIndex) =>
      model.getChoiceVariantsByStringIndex(pointIndex);
}
