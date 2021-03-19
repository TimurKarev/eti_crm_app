import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:eti_crm_app/ui/reusable_widgets/four_point_chip.dart';
import 'package:flutter/material.dart';

class ViewChecklistPage extends StatefulWidget {
  final ChecklistPresenter presenter;

  ViewChecklistPage({Key key, this.presenter}) : super(key: key);

  @override
  _ViewChecklistPageState createState() => _ViewChecklistPageState();
}

class _ViewChecklistPageState extends State<ViewChecklistPage> {
  List<bool> expanded;

  @override
  void initState() {
    super.initState();
    expanded = List<bool>.filled(widget.presenter.sectionsNumber, false);
  }

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
    List<ExpansionPanel> listExpPanels = [];
    for (var s = 0; s < widget.presenter.sectionsNumber; s++) {
      List<Widget> listTiles = [];
      for (var p = 0; p < widget.presenter.getPointsNumberInSection(s); p++) {
        final point = widget.presenter.getSectionPointByIndex(s, p);
        final label = widget.presenter
            .getPointValueByStringIndex(point['variant_index'], point['value']);
        listTiles.add(ListTile(
          title: Text(point['label']),
          subtitle: Text(point['comment']),
          trailing: FourPointChip(
            value: point['value'],
            label: label,
          ),
        ));
      }
      listExpPanels.add(ExpansionPanel(
        canTapOnHeader: true,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            trailing: Icon(Icons.check_circle, color: Colors.red,),
            title: Text(
              widget.presenter.getSectionLabelByIndex(s),
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        },
        isExpanded: expanded[s],
        body: Container(
          child: Column(
            children: listTiles,
          ),
        ),
      ));
    }
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          expanded[index] = !isExpanded;
        });
      },
      children: listExpPanels,
    );
  }
}
