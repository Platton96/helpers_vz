import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/models/area_figure.dart';
import 'package:helpers_vz/models/figure_dimension.dart';

extension LocalizedEnums on AppStrings {
  String areaQuestion(AreaFigure figure) => switch (figure) {
        .square => squareQuestion,
        .rectangle => rectangleQuestion,
        .parallelogram => parallelogramQuestion,
        .triangle => triangleQuestion,
        .rightTriangle => rightTriangleQuestion,
        .rhombus => rhombusQuestion,
        .trapezoid => trapezoidQuestion,
      };

  String measurement(FigureDimension dimension, int value) => switch (dimension) {
        .side => sideMeasurement(value),
        .length => lengthMeasurement(value),
        .width => widthMeasurement(value),
        .base => baseMeasurement(value),
        .height => heightMeasurement(value),
        .leg => legMeasurement(value),
        .diagonal => diagonalMeasurement(value),
      };

  String optionLetter(int index) => switch (index) {
        0 => optionLetterA,
        1 => optionLetterB,
        2 => optionLetterC,
        _ => optionLetterD,
      };
}
