import 'package:eti_crm_app/mvp/edit_form_presenter.dart';
import 'package:eti_crm_app/mvp/point_forms/choice_form_widget.dart';
import 'package:eti_crm_app/mvp/point_forms/integer_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFormBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final presenter = context.read(editFormPresenterProvider);
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
            updateModelCallback: presenter.update,
          ));
        }
      }
    }
    return Container(child: Column(children: result));
  }
}
