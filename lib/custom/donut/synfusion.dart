/// Package import
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartSampleData {
  ChartSampleData({required this.x, required this.y});
  final String x;
  final double y;
}

class DonutSyncfusion extends StatelessWidget {
  const DonutSyncfusion({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(sections: [
        PieChartSectionData(
          color: Colors.red,
          value: 40,
          title: '40%',
          radius: 50,
          titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.green,
          value: 30,
          title: '30%',
          radius: 50,
          titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.blue,
          value: 15,
          title: '15%',
          radius: 90,
          titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.yellow,
          value: 15,
          title: '15%',
          radius: 50,
          titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ], centerSpaceRadius: 90),

      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }

  /// Returns the circular charts with rounded corner doughnut series.
  SfCircularChart _buildRoundedDoughnutChart() {
    return SfCircularChart(
      legend:
          Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(text: true ? '' : 'Software development cycle'),
      series: _getRoundedDoughnutSeries(),
    );
  }

  /// Returns rounded corner doughunut series.
  List<DoughnutSeries<ChartSampleData, String>> _getRoundedDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Planning', y: 50),
          ChartSampleData(x: 'Analysis', y: 10),
          ChartSampleData(x: 'Design', y: 10),
          ChartSampleData(x: 'Development', y: 10),
          ChartSampleData(x: 'Testing & Integration', y: 10),
          ChartSampleData(x: 'Maintainance', y: 10)
        ],
        animationDuration: 0,
        cornerStyle: CornerStyle.bothCurve,
        radius: '70%',
        innerRadius: '60%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
      ),
    ];
  }
}
