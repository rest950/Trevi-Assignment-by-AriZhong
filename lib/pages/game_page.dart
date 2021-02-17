import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trevi_assignment/viewmodels/gamepage_viewmodel.dart';
import 'package:trevi_assignment/widgets/colunit.dart';

//產生畫面
class GamePageArguments {
  final int colNum;
  final int rowNum;

  GamePageArguments(this.colNum, this.rowNum);
}

class GamePage extends StatelessWidget {
  static const routeName = '/game';

  List<Widget> _getColumnUnits(int colUnitNum, int rowUnitNum, int x, int y,
      GamePageViewModel viewModel) {
    final selectCol = x ?? -1;
    final selectRow = y ?? -1;
    final widgets = List<Widget>();
    for (int i = 0; i < colUnitNum; i++) {
      widgets.add(ColumnUnit(
        rowUnitNum: rowUnitNum,
        selected: selectCol == i,
        selectedRowNum: (selectCol == i) ? selectRow : -1,
        btnPressed: (selectCol == i) ? () => viewModel.Clean() : null,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final GamePageArguments args = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider<GamePageViewModel>(
      create: (context) => GamePageViewModel(args.colNum, args.rowNum),
      child: Scaffold(
        body: Consumer<GamePageViewModel>(
          builder: (context, viewModel, child) {
            return Row(
              children: _getColumnUnits(viewModel.colNum, viewModel.rowNum,
                  viewModel.randomX, viewModel.randomY, viewModel),
            );
          },
        ),
      ),
    );
  }
}
