import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/point_forms/choice_form_widget.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditChecklistPage extends StatelessWidget {
  final ChecklistPresenter presenter;

  const EditChecklistPage({Key key, this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: presenter.barTitle),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(children: _getBody(context)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          try {
            await presenter.saveChecklist(context.read(cloudFirebaseServiceProvider));
            Navigator.pushNamedAndRemoveUntil(
                context, ChecklistExtractArg.routeName, (r) => false,
                arguments: ChecklistArguments(
                    orderNum: presenter.orderNum,
                    action: ChecklistArguments.CHECKLIST_ACTION_VIEW,
                    type: presenter.type));
          } catch (e) {
            print(e.toString());
          }
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
              editable: true,
              updateModelCallback: null));
        }
        if (point['type'] == 'choice') {
          final variants =
              presenter.getChoiceVariantsByStringIndex(point['variant_index']);
          result.add(ChoiceFormWidget(
            point: point,
            variants: variants,
            sectionIndex: sIndex,
            pointIndex: pIndex,
            editable: true,
            updateModelCallback: null,
          ));
        }
      }
    }
    return result;
  }
}
