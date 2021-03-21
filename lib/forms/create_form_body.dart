import 'package:eti_crm_app/forms/edit_form_presenter.dart';
import 'package:eti_crm_app/forms/point_forms/choice_form_widget.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateFormBody extends ConsumerWidget {
  final editable;

  CreateFormBody({this.editable});

  @override
  Widget build(BuildContext context, watch) {
    final stateNotifier = watch(editFormStateNotifier);
    final presenter = context.read(editFormPresenterProvider);
    List<Widget> result = [];
    //print('build ${stateNotifier.state.isOrderExistError}');
    if (stateNotifier.state.isOrderExistError) {
      //print('Error');
      result.add(
        Text(
          stateNotifier.state.errorMessage,
          style: TextStyle(
              backgroundColor: Colors.redAccent.shade50, color: Colors.black),
        ),
      );
    }
    for (var sIndex = 0; sIndex < presenter.sectionsNumber; sIndex++) {
      result.add(
        SizedBox(
          height: 10.0,
        ),
      );
      result.add(
        Text(
          presenter.getSectionLabelByIndex(sIndex),
          style: Theme.of(context).textTheme.headline6,
        ),
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
              editable: editable,
              updateModelCallback: presenter.update));
        }
        if (point['type'] == 'choice') {
          final variants =
              presenter.getChoiceVariantsByStringIndex(point['variants_index']);
          result.add(ChoiceFormWidget(
            point: point,
            variants: variants,
            sectionIndex: sIndex,
            pointIndex: pIndex,
            editable: editable,
            updateModelCallback: presenter.update,
          ));
        }
      }
    }
    return SingleChildScrollView(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(
          250.0,
          10.0,
          250.0,
          0.0,
        ),
        child: Column(children: result),
      )),
    );
  }
}
