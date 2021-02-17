import 'package:flutter/material.dart';

//列單元Widget
class RowUnit extends StatelessWidget {
  final bool selected;

  const RowUnit({Key key, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            color: selected ? Colors.blue : Colors.grey,
            width: double.infinity,
            child: selected
                ? FittedBox(
                    child: Text('Random'),
                  )
                : null));
  }
}
