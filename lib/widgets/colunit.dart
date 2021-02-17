import 'package:flutter/material.dart';
import 'package:trevi_assignment/widgets/rowunit.dart';

//欄單元Widget
class ColumnUnit extends StatelessWidget {
  final int rowUnitNum;
  final bool selected;
  final int selectedRowNum;
  final VoidCallback btnPressed;

  ColumnUnit({
    Key key,
    this.rowUnitNum = 0,
    this.selected = false,
    this.selectedRowNum,
    @required this.btnPressed,
  }) : super(key: key);

  final selectedDecoration =
      BoxDecoration(border: Border.all(color: Colors.blue, width: 3));

  List<Widget> _getRowUnits(
      int unitNum, VoidCallback onPressed, int selectRowNum) {
    final selectedNum = selectRowNum ?? -1;
    final widgets = List<Widget>();
    for (int i = 0; i < unitNum; i++) {
      widgets.add(RowUnit(
        selected: selectedNum == i,
      ));
    }
    widgets.add(RaisedButton(
      onPressed: onPressed,
      child: FittedBox(child: Text('Confirm')),
      color: selected ? Colors.blue : Colors.blueGrey,
    ));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          decoration: selected ? selectedDecoration : null,
          child: Column(
            children: _getRowUnits(rowUnitNum, btnPressed, selectedRowNum),
          ),
        ),
      ),
    );
  }
}
