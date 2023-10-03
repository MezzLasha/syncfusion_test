import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_test/custom/chart_card.dart';
import 'package:syncfusion_test/main.dart';

class DoghnutChart extends StatelessWidget {
  const DoghnutChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, '25%', const Color(0xFF69C6F9)),
      ChartData('Steve', 38, "38%", const Color(0xFF25CED1)),
      ChartData('Jack', 34, "34%", const Color(0xFFD8F3FF)),
      ChartData('Others', 52, "52%", const Color(0xFF0791EF))
    ];

    return ChartCard(
      child: Expanded(
        child: SfCircularChart(
          annotations: [
            CircularChartAnnotation(
              widget: const Center(
                child: Text(
                  'სულ გაყიდვები \n\$000.000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              cornerStyle: CornerStyle.bothFlat,
              innerRadius: "70%",
              // explode: true,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                useSeriesColor: true,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                // borderRadius: 50,
                // margin: EdgeInsets.all(8),
                connectorLineSettings: ConnectorLineSettings(width: 0),
              ),
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.name,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.percent,
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.name, this.y, this.percent, [this.color = Colors.grey]);
  final String name;
  final double y;
  final String percent;
  final Color color;
}
