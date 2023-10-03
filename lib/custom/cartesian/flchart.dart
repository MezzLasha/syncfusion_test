import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_test/custom/theme.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    MyTheme.cyan,
    MyTheme.blue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12, color: MyTheme.textSecondary);
    Widget text;

    DateTime start = DateTime(2023, 0, 0);

    text = Text(
        DateFormat('MMM').format(start.add(Duration(days: value.toInt() * 30))),
        style: style,
        textAlign: TextAlign.left);

    // text = Text('${value.toInt()}', style: style, textAlign: TextAlign.left);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12, color: MyTheme.textSecondary);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: MyTheme.grey,
            strokeWidth: 1,
            dashArray: [4, 4],
          );
        },
      ),
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          tooltipBorder: const BorderSide(
            color: MyTheme.blue,
            width: 3,
          ),
          tooltipPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          fitInsideHorizontally: false,
          fitInsideVertically: true,
          maxContentWidth: 100,
          rotateAngle: 0,
          showOnTopOfTheChartBoxArea: false,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipHorizontalOffset: 0,
          tooltipMargin: 16,
          tooltipRoundedRadius: 8,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              if (flSpot.x == 0 || flSpot.x == 11) {
                return null;
              }
              return LineTooltipItem(
                '${flSpot.y}',
                const TextStyle(
                  color: MyTheme.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            final FlSpot spot = barData.spots[spotIndex];
            if (spot.x == 0 || spot.x == 11) {
              return null;
            }
            return TouchedSpotIndicatorData(
              const FlLine(color: MyTheme.purple, strokeWidth: 6),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 8,
                    color: Colors.white,
                    strokeWidth: 5,
                    strokeColor: MyTheme.purple,
                  );
                },
              ),
            );
          }).toList();
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 25,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: MyTheme.blue,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, gradient: MyTheme.blueGradient),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(2.6, 1),
            FlSpot(3.9, 2),
            FlSpot(5.8, 1),
            FlSpot(8, 3),
            FlSpot(9.5, 2),
            FlSpot(11, 2),
          ],
          isCurved: true,
          color: MyTheme.cyan,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, gradient: MyTheme.cyanGradient),
        ),
      ],
    );
  }
}
