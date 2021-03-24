import 'package:eti_crm_app/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eti_crm_app/forms/order_extract_arg.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:eti_crm_app/presenters/order_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';

class EditOrderPage extends StatelessWidget {
  final OrderPresenter presenter;

  const EditOrderPage({Key key, @required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: 'Редактирование заказа №${presenter.orderNum}'),
      body: SingleChildScrollView(child: _getOrderBody(context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          await presenter.saveOrder(context.read(cloudFirebaseServiceProvider));
          await Navigator.pushNamedAndRemoveUntil(context, OrderExtractArg.routeName, (r)=>false,
              arguments: OrderArguments(
                  action: OrderArguments.ACTION_VIEW_EXIST_ORDER,
                  orderNum: presenter.orderNum));
        },
      ),
    );
  }

  Widget _getOrderBody(BuildContext context) {
    final Widget title = Text(
      'Редактирование заказа N${presenter.orderNum}',
      style: Theme.of(context).textTheme.headline5,
    );
    List<Widget> result = [];
    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: title)],
    ));
    result.add(SizedBox(
      height: 10.0,
    ));
    for (var s = 0; s < presenter.sectionsNumber; s++) {
      List<Widget> rows = [];
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${presenter.getSectionLabelByIndex(s)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      );
      for (var p = 0; p < presenter.getPointsNumberInSection(s); p++) {
        final point = presenter.getSectionPointByIndex(s, p);
        Widget value;
        if (point['type'] == 'integer') {
          value = IntegerFormWidget(
            point: point,
            pointIndex: p,
            sectionIndex: s,
            updateModelCallback: presenter.model.setPointValueByIndex,
          );
        }
        final row = Padding(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: Row(
            children: [
              Text(point['label']),
              Spacer(),
              value,
            ],
          ),
        );
        rows.add(row);
      }
      final card = Card(
        child: Column(
          children: rows,
        ),
      );
      result.add(card);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(250.0, 10.0, 250.0, 0.0),
      child: Center(
        child: Column(
          children: result,
        ),
      ),
    );
  }
}
