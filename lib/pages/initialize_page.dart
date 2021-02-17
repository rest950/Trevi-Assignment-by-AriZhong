import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trevi_assignment/pages/game_page.dart';

//輸入畫面
class InitializePage extends StatelessWidget {
  static const routeName = '/init';

  final TextEditingController _colController = TextEditingController();
  final TextEditingController _rowController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trevi Assignment by AriZhong'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text(
                  'Please input column(>0) and row(>0):',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Flexible(
                child: Container(
                  width: 100,
                  child: TextField(
                    maxLines: 1,
                    maxLength: 2,
                    controller: _colController,
                    decoration: InputDecoration(
                      hintText: 'column',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 100,
                  child: TextField(
                    maxLines: 1,
                    maxLength: 2,
                    controller: _rowController,
                    decoration: InputDecoration(
                      hintText: 'row',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                  ),
                ),
              ),
              Flexible(
                child: FlatButton(
                    onPressed: () {
                      int col = int.tryParse(_colController.text);
                      int row = int.tryParse(_rowController.text);
                      if (col == null || row == null) return;
                      if (col == 0 || row == 0) return;
                      Navigator.pushNamed(context, GamePage.routeName,
                          arguments: GamePageArguments(col, row));
                    },
                    child: Text('Next->')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
