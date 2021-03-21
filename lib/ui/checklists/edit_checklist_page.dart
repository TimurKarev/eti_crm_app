import 'package:eti_crm_app/forms/checklist_extract_arg.dart';
import 'package:eti_crm_app/presenters/checklist_presenter.dart';
import 'package:eti_crm_app/providers/providers.dart';
import 'package:eti_crm_app/ui/reusable_widgets/checklist_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class EditChecklistPage extends StatefulWidget {
  final ChecklistPresenter presenter;

  EditChecklistPage({Key key, this.presenter}) : super(key: key);

  @override
  _EditChecklistPageState createState() => _EditChecklistPageState();
}

class _EditChecklistPageState extends State<EditChecklistPage> {
  List<bool> expanded;

  @override
  void initState() {
    super.initState();
    expanded = List<bool>.filled(widget.presenter.sectionsNumber, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChecklistAppBar(titleText: 'widget.presenter.barTitle'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            SingleChildScrollView(child: Container(child: _getBody(context))),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          try {
            await widget.presenter
                .saveChecklist(context.read(cloudFirebaseServiceProvider));
            Navigator.pushNamedAndRemoveUntil(
                context, ChecklistExtractArg.routeName, (r) => false,
                arguments: ChecklistArguments(
                    orderNum: widget.presenter.orderNum,
                    action: ChecklistArguments.CHECKLIST_ACTION_VIEW,
                    type: widget.presenter.type));
          } catch (e) {
            print(e.toString());
          }
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
        listTiles.add(ListTile(
          title: Text(point['label']),
          subtitle: Text(point['comment']),
          trailing: DropdownWidget(
            pointIndex: p,
            sectionIndex: s,
            point: point,
            variants: widget.presenter.model
                .getChoiceVariantsByStringIndex(point['variant_index']),
            updateModelCallback: _updateModel,
          ),
        ));
      }
      listExpPanels.add(ExpansionPanel(
        canTapOnHeader: true,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
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

  void _updateModel(int sInd, int pInd, String value) {
    widget.presenter.model.setPointValueByIndex(sInd, pInd, value);
    print(widget.presenter.model.getSectionPointByIndex(sInd, pInd).toString());
  }
}

class DropdownWidget extends StatefulWidget {
  final Map<String, dynamic> point;
  final List<dynamic> variants;
  final int sectionIndex;
  final int pointIndex;
  final void Function(int, int, String) updateModelCallback;

  DropdownWidget(
      {@required this.point,
      @required this.variants,
      @required this.sectionIndex,
      @required this.pointIndex,
      @required this.updateModelCallback});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var value;

  @override
  void initState() {
    super.initState();
    value = widget.point['value'];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          value = newValue;
          widget.updateModelCallback(
              widget.sectionIndex, widget.pointIndex, value);
        });
      },
      items: widget.variants.map<DropdownMenuItem<String>>((variant) {
        return DropdownMenuItem<String>(
          value: variant['value'],
          child: Text(variant['label']),
        );
      }).toList(),
    );
  }
}
