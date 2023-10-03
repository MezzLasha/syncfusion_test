import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_test/custom/theme.dart';

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            right: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            top: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
          ),
        ),
        sectionsSpace: 5,
        centerSpaceRadius: 70,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 35.0 : 30.0;
      final widgetSize = isTouched ? 40.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0791EF),
            value: 40,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: [],
            ),
            badgeWidget: _Badge(
              '40%',
              size: widgetSize,
              borderColor: const Color(0xff0791EF),
            ),
            badgePositionPercentageOffset: 2,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff69C6F9),
            value: 30,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: [],
            ),
            badgeWidget: _Badge(
              '30%',
              size: widgetSize,
              borderColor: const Color(0xff69C6F9),
            ),
            badgePositionPercentageOffset: 2,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff25CED1),
            value: 16,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: [],
            ),
            badgeWidget: _Badge(
              '16%',
              size: widgetSize,
              borderColor: const Color(0xff25CED1),
            ),
            badgePositionPercentageOffset: 2,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xffD8F3FF),
            value: 15,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: [],
            ),
            badgeWidget: _Badge(
              '15%',
              size: widgetSize,
              borderColor: const Color(0xffD8F3FF),
            ),
            badgePositionPercentageOffset: 2,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: borderColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(svgAsset,
            style: TextStyle(
                fontSize: size * .35,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
