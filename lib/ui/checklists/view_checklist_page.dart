import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/point_forms/choice_form_widget.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';

class ViewChecklistPage extends StatelessWidget {
  final ChecklistPresenter presenter;

  const ViewChecklistPage({Key key, this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: presenter.barTitle),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(children: _getBody(context)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.pushNamed(context, ChecklistExtractArg.routeName,
              arguments: ChecklistArguments(
                  orderNum: presenter.orderNum,
                  action: ChecklistArguments.CHECKLIST_ACTION_EDIT,
                  type: presenter.type));
        },
      ),
    );
  }

  List<Widget> _getBody(BuildContext context) {
    List<Widget> result = [];
    for (var sIndex = 0; sIndex < presenter.sectionsNumber; sIndex++) {
      result.add(
        Text(presenter.getSectionLabelByIndex(sIndex)),
      );
      for (var pIndex = 0;
          pIndex < presenter.getPointsNumberInSection(sIndex);
          pIndex++) {
        final point = presenter.getSectionPointByIndex(sIndex, pIndex);
        if (point['type'] == 'integer') {
          result.add(IntegerFormWidget(
              point: point,
              sectionIndex: sIndex,
              pointIndex: pIndex,
              editable: false,
              updateModelCallback: null));
        }
        if (point['type'] == 'choice') {
          final variants = null;
          result.add(ChoiceFormWidget(
            point: point,
            variants: variants,
            sectionIndex: sIndex,
            pointIndex: pIndex,
            editable: false,
            updateModelCallback: null,
          ));
        }
      }
    }
    return result;
  }
}
