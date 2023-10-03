import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_test/custom/theme.dart';

class ChartSampleData {
  final DateTime x;
  final double y;
  final double secondSeriesYValue;

  ChartSampleData(
      {required this.x, required this.y, required this.secondSeriesYValue});
}

class SyncfusionTrendlineWidget extends StatefulWidget {
  const SyncfusionTrendlineWidget({super.key});

  @override
  State<SyncfusionTrendlineWidget> createState() =>
      _SyncfusionTrendlineWidgetState();
}

class _SyncfusionTrendlineWidgetState extends State<SyncfusionTrendlineWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildSplineAreaChart();
  }

  /// Returns the cartesian spline are chart.
  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      legend: const Legend(isVisible: true, opacity: 0.7),
      title: ChartTitle(text: ''),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          interval: 2,
          dateFormat: DateFormat('MMM'),
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        builder: (data, point, series, pointIndex, seriesIndex) {
          final d = data;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffABD7EB),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '\$${data.y1}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  List<_SplineAreaData>? chartData;

  @override
  void initState() {
    chartData = <_SplineAreaData>[
      _SplineAreaData(DateTime(2010, 1), 10.53, 3.3), // January
      _SplineAreaData(DateTime(2010, 2), 9.5, 5.4), // February
      _SplineAreaData(DateTime(2010, 3), 10, 2.65), // March
      _SplineAreaData(DateTime(2010, 4), 9.4, 2.62), // April
      _SplineAreaData(DateTime(2010, 5), 5.8, 1.99), // May
      _SplineAreaData(DateTime(2010, 6), 4.9, 1.44), // June
      _SplineAreaData(DateTime(2010, 7), 4.5, 2), // July
      _SplineAreaData(DateTime(2010, 8), 3.6, 1.56), // August
      _SplineAreaData(DateTime(2010, 9), 3.43, 2.1), // September
      _SplineAreaData(DateTime(2010, 10), 3.43, 2.1), // October
      _SplineAreaData(DateTime(2010, 11), 3.43, 2.1), // November
      _SplineAreaData(DateTime(2010, 12), 3.43, 2.1), // December
    ];
    super.initState();
  }

  /// Returns the list of chart series
  /// which need to render on the spline area chart.
  List<ChartSeries<_SplineAreaData, DateTime>> _getSplieAreaSeries() {
    return <ChartSeries<_SplineAreaData, DateTime>>[
      SplineAreaSeries<_SplineAreaData, DateTime>(
        dataSource: chartData!,
        gradient: MyTheme.blueGradient,
        borderColor: MyTheme.blue,
        borderWidth: 4,
        name: '1',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
      SplineAreaSeries<_SplineAreaData, DateTime>(
        dataSource: chartData!,
        borderColor: MyTheme.cyan,
        borderWidth: 4,
        gradient: MyTheme.cyanGradient,
        name: '2',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the spline area chart datapoints.
class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);
  final DateTime year;
  final double y1;
  final double y2;
}
