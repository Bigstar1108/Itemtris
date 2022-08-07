import 'package:flutter/material.dart';

class TetrisScreen extends StatefulWidget {
  const TetrisScreen({Key? key}) : super(key: key);

  @override
  State<TetrisScreen> createState() => _TetrisScreenState();
}

class _TetrisScreenState extends State<TetrisScreen> {
  int direction = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Tetromino(
                    type: TetrominoType.iTetromino,
                    direction: direction,
                  ),
                  const SizedBox(width: 16),
                  Tetromino(
                    type: TetrominoType.oTetromino,
                    direction: direction,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Tetromino(
                    type: TetrominoType.tTetromino,
                    direction: direction,
                  ),
                  const SizedBox(width: 16),
                  Tetromino(
                    type: TetrominoType.sTetromino,
                    direction: direction,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Tetromino(
                    type: TetrominoType.zTetromino,
                    direction: direction,
                  ),
                  const SizedBox(width: 16),
                  Tetromino(
                    type: TetrominoType.jTetromino,
                    direction: direction,
                  ),
                ],
              ),
              Tetromino(
                type: TetrominoType.lTetromino,
                direction: direction,
              ),
              ElevatedButton(
                onPressed: () {
                  if (direction == 3) {
                    setState(() {
                      direction = 0;
                    });

                    return;
                  }

                  setState(() {
                    direction = direction + 1;
                  });
                },
                child: const Text('Change Rotation'),
              ),
            ].expand((tetromino) => [const SizedBox(height: 8), tetromino]).skip(1).toList(),
          ),
        ),
      ),
    );
  }
}

// https://tetris.wiki/Tetromino
enum TetrominoType {
  iTetromino,
  oTetromino,
  tTetromino,
  sTetromino,
  zTetromino,
  jTetromino,
  lTetromino,
}

extension TetrominoExtension on TetrominoType {
  List<List<List<double>>> get rotateShape {
    switch (this) {
      case TetrominoType.lTetromino:
        return [
          [
            [0, 0, 1],
            [1, 1, 1],
            [0, 0, 0],
          ],
          [
            [0, 1, 0],
            [0, 1, 0],
            [0, 1, 1],
          ],
          [
            [0, 0, 0],
            [1, 1, 1],
            [1, 0, 0],
          ],
          [
            [1, 1, 0],
            [0, 1, 0],
            [0, 1, 0],
          ],
        ];
      case TetrominoType.jTetromino:
        return [
          [
            [1, 0, 0],
            [1, 1, 1],
            [0, 0, 0],
          ],
          [
            [0, 1, 1],
            [0, 1, 0],
            [0, 1, 0],
          ],
          [
            [0, 0, 0],
            [1, 1, 1],
            [0, 0, 1],
          ],
          [
            [0, 1, 0],
            [0, 1, 0],
            [1, 1, 0],
          ],
        ];
      case TetrominoType.zTetromino:
        return [
          [
            [0, 0, 0],
            [1, 1, 0],
            [0, 1, 1],
          ],
          [
            [0, 1, 0],
            [1, 1, 0],
            [1, 0, 0],
          ],
          [
            [0, 0, 0],
            [1, 1, 0],
            [0, 1, 1],
          ],
          [
            [0, 1, 0],
            [1, 1, 0],
            [1, 0, 0],
          ],
        ];
      case TetrominoType.sTetromino:
        return [
          [
            [0, 0, 0],
            [0, 1, 1],
            [1, 1, 0],
          ],
          [
            [1, 0, 0],
            [1, 1, 0],
            [0, 1, 0],
          ],
          [
            [0, 0, 0],
            [0, 1, 1],
            [1, 1, 0],
          ],
          [
            [1, 0, 0],
            [1, 1, 0],
            [0, 1, 0],
          ],
        ];
      case TetrominoType.tTetromino:
        return [
          [
            [0, 1, 0],
            [1, 1, 1],
            [0, 0, 0],
          ],
          [
            [0, 1, 0],
            [0, 1, 1],
            [0, 1, 0],
          ],
          [
            [0, 0, 0],
            [1, 1, 1],
            [0, 1, 0],
          ],
          [
            [0, 1, 0],
            [1, 1, 0],
            [0, 1, 0],
          ],
        ];
      case TetrominoType.iTetromino:
        return [
          [
            [0, 0, 0, 0],
            [1, 1, 1, 1],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
          ],
          [
            [0, 1, 0, 0],
            [0, 1, 0, 0],
            [0, 1, 0, 0],
            [0, 1, 0, 0],
          ],
          [
            [0, 0, 0, 0],
            [1, 1, 1, 1],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
          ],
          [
            [0, 1, 0, 0],
            [0, 1, 0, 0],
            [0, 1, 0, 0],
            [0, 1, 0, 0],
          ],
        ];
      case TetrominoType.oTetromino:
        return [
          [
            [1, 1],
            [1, 1],
          ],
          [
            [1, 1],
            [1, 1],
          ],
          [
            [1, 1],
            [1, 1],
          ],
          [
            [1, 1],
            [1, 1],
          ],
        ];
      default:
        return [];
    }
  }

  List<List<double>> getRoateShapeByDirection({int direction = 0}) {
    final rotateShape = this.rotateShape;

    return rotateShape[direction];
  }

  Color get color {
    switch (this) {
      case TetrominoType.iTetromino:
        return Colors.blueAccent;
      case TetrominoType.oTetromino:
        return Colors.orangeAccent;
      case TetrominoType.tTetromino:
        return Colors.deepPurpleAccent;
      case TetrominoType.sTetromino:
        return Colors.lightGreenAccent;
      case TetrominoType.zTetromino:
        return Colors.redAccent;
      case TetrominoType.jTetromino:
        return Colors.lightBlue;
      case TetrominoType.lTetromino:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }
}

class Tetromino extends StatelessWidget {
  final TetrominoType type;
  final int direction;

  const Tetromino({
    Key? key,
    required this.type,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<double>> rotateShape = type.getRoateShapeByDirection(direction: direction);

    final List<double> expandedRotateShape = rotateShape.expand((e) => e).toList();
    final int totalPointList = expandedRotateShape.length;

    final int columnLength = (totalPointList ~/ rotateShape.length);

    const double size = 20;

    return SizedBox(
      width: size * columnLength,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: totalPointList,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnLength,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Offstage(
            offstage: expandedRotateShape[index] == 0,
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: type.color,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
