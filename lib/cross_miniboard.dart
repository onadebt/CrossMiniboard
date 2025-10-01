import 'package:cross_miniborad/tile.dart';
import 'package:flutter/material.dart';

class CrossMiniboard extends StatelessWidget {
  final int side;

  const CrossMiniboard({super.key, required this.side});
  String nthLetter(int n) => String.fromCharCode('A'.codeUnitAt(0) + n);


  @override
  Widget build(BuildContext context) {
    if (side < 1 || side > 7 || side % 2 == 0) {
      return const Center(
        child: Text(
          'Side must be an odd number between <1, 7>',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(side, (row) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(side, (col) {

              // pre lepsi vypocvet, nechcelo sa mi hrat s 0-based indexami
              int rowIndex = row + 1;
              int colIndex = col + 1;

              bool isOnCross = (rowIndex == colIndex) || (colIndex == side - rowIndex + 1);
              bool isFirstColumn = (colIndex == 1);
              bool isLastRow = (rowIndex == side);
              String tileText = '';

              if (isLastRow && isFirstColumn) {
                tileText = '${nthLetter(col)}$rowIndex';
              } else if (isLastRow) {
                tileText = nthLetter(col);
              } else if (isFirstColumn) {
                tileText = '$rowIndex';
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Tile(
                  text: tileText,
                  color: isOnCross ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
