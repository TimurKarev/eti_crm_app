import 'package:eti_crm_app/forms/order_extract_arg.dart';
import 'package:eti_crm_app/presenters/order_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';

class ViewOrderPage extends StatelessWidget {
  final OrderPresenter presenter;

  const ViewOrderPage({Key key, @required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: 'Заказ №${presenter.orderNum}'),
      body: SingleChildScrollView(child: _getOrderBody(context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () async {
          await Navigator.pushNamed(context, OrderExtractArg.routeName,
              arguments: OrderArguments(
                  action: OrderArguments.ACTION_EDIT_EXIST_ORDER,
                  orderNum: presenter.orderNum));
        },
      ),
    );
  }

  Widget _getOrderBody(BuildContext context) {
    final Widget title = Text(
      'Заказ N${presenter.orderNum}',
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

        final row = Padding(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: Row(
            children: [
              Text(point['label']),
              Spacer(),
              Text(point['value']),
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
