import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/forms/point_forms/choice_form_widget.dart';
import 'package:eti_crm_app/forms/point_forms/integer_form_widget.dart';
import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter/material.dart';

class ViewChecklistPage extends StatefulWidget {
  final ChecklistPresenter presenter;

  const ViewChecklistPage({Key key, this.presenter}) : super(key: key);

  @override
  _ViewChecklistPageState createState() => _ViewChecklistPageState();
}

class _ViewChecklistPageState extends State<ViewChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: widget.presenter.barTitle),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            SingleChildScrollView(child: Container(child: _getBody(context))),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.pushNamed(context, ChecklistExtractArg.routeName,
              arguments: ChecklistArguments(
                  orderNum: widget.presenter.orderNum,
                  action: ChecklistArguments.CHECKLIST_ACTION_EDIT,
                  type: widget.presenter.type));
        },
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    // List<Widget> result = [];
    // for (var sIndex = 0; sIndex < presenter.sectionsNumber; sIndex++) {
    //   result.add(
    //     Text(presenter.getSectionLabelByIndex(sIndex)),
    //   );
    //   for (var pIndex = 0;
    //       pIndex < presenter.getPointsNumberInSection(sIndex);
    //       pIndex++) {
    //     final point = presenter.getSectionPointByIndex(sIndex, pIndex);
    //     if (point['type'] == 'integer') {
    //       result.add(IntegerFormWidget(
    //           point: point,
    //           sectionIndex: sIndex,
    //           pointIndex: pIndex,
    //           editable: false,
    //           updateModelCallback: null));
    //     }
    //     if (point['type'] == 'choice') {
    //       final variants = null;
    //       result.add(ChoiceFormWidget(
    //         point: point,
    //         variants: variants,
    //         sectionIndex: sIndex,
    //         pointIndex: pIndex,
    //         editable: false,
    //         updateModelCallback: null,
    //       ));
    //     }
    //   }
    // }
    List<ExpansionPanel> listExpPanels = [];
    for (var s=0; s<widget.presenter.sectionsNumber; s++) {
      List<Widget> listTiles = [];
      for (var p=0; p<widget.presenter.getPointsNumberInSection(s); p++) {
        final point = widget.presenter.getSectionPointByIndex(s, p);
        print(point.toString());
        listTiles.add(ListTile(
          title: Text(point['label']),
          subtitle: Text(point['comment']),
          trailing: Text(point['value']),
        ));
      }
      listExpPanels.add(ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(widget.presenter.getSectionLabelByIndex(s)),
          );
        },
        isExpanded: true,
        body: Container(
          child: Column(
            children: listTiles,
          ),
        ),
      ));
    }
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {});
      },
      children: listExpPanels,
    );
  }
}
