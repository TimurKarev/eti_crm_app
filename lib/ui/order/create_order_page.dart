import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/reusable_widgets/dropdown_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eti_crm_app/forms/order_extract_arg.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:eti_crm_app/presenters/order_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  final OrderPresenter presenter;

  const CreateOrderPage({Key key, @required this.presenter}) : super(key: key);

  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: 'Новый заказ'),
      body: _getOrderBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          try {
            await widget.presenter
                .createOrder(context.read(cloudFirebaseServiceProvider));
            await Navigator.pushNamedAndRemoveUntil(
                context, OrderExtractArg.routeName, (r) => false,
                arguments: OrderArguments(
                    action: OrderArguments.ACTION_VIEW_EXIST_ORDER,
                    orderNum: widget.presenter.model.firstElementValue));
          } catch (e, _) {
            print(e.toString());
            setState(() {
              isError = true;
            });
          }
        },
      ),
    );
  }

  Widget _getOrderBody(BuildContext context) {
    final Widget title = Text(
      'Новый заказ',
      style: Theme.of(context).textTheme.headline5,
    );
    List<Widget> result = [];
    if (isError) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 40.0,
              child: Card(
                elevation: 15.0,
                color: Colors.red.shade300,
                child: Text('Заказ с таким номером уже существует'),
              ),
            ),
          ),
        ],
      ));
    }
    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: title)],
    ));
    result.add(SizedBox(
      height: 10.0,
    ));
    for (var s = 0; s < widget.presenter.sectionsNumber; s++) {
      List<Widget> rows = [];
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.presenter.getSectionLabelByIndex(s)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      );
      for (var p = 0; p < widget.presenter.getPointsNumberInSection(s); p++) {
        final point = widget.presenter.getSectionPointByIndex(s, p);
        Widget value;
        if (point['type'] == 'integer') {
          value = IntegerFormWidget(
            point: point,
            pointIndex: p,
            sectionIndex: s,
            updateModelCallback: widget.presenter.model.setPointValueByIndex,
          );
        } else if (point['type'] == 'choice') {
          value = DropdownWidget(
            point: point,
            variants: widget.presenter.model
                .getChoiceVariantsByStringIndex(point['variant_index']),
            sectionIndex: s,
            pointIndex: p,
            updateModelCallback: widget.presenter.model.setPointValueByIndex,
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
      padding: const EdgeInsets.fromLTRB(500.0, 10.0, 500.0, 0.0),
      child: Center(
        child: Column(
          children: result,
        ),
      ),
    );
  }
}
