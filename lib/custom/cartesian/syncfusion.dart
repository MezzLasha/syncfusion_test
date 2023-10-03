import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_test/custom/theme.dart';

class SalesData {
  SalesData(this.numeric, this.country, this.sales1, this.sales2, this.sales3,
      this.sales4, this.sales5);
  final DateTime numeric;
  final String country;
  final double sales1;
  final double sales2;
  final double sales3;
  final double sales4;
  final double sales5;
}

class SyncfusionTrendlineWidget extends StatefulWidget {
  const SyncfusionTrendlineWidget({super.key});
  static List<SplineAreaSeries<SalesData, num>> getDefaultData() {
    final List<SalesData> chartData = <SalesData>[
      SalesData(DateTime(2005, 0, 1), 'India', 1.5, 21, 28, 680, 760),
      SalesData(DateTime(2006, 0, 1), 'China', 2.2, 24, 44, 550, 880),
      SalesData(DateTime(2007, 0, 1), 'USA', 3.32, 36, 48, 440, 788),
      SalesData(DateTime(2008, 0, 1), 'Japan', 4.56, 38, 50, 350, 560),
      SalesData(DateTime(2009, 0, 1), 'Russia', 5.87, 54, 66, 444, 566),
      SalesData(DateTime(2010, 0, 1), 'France', 6.8, 57, 78, 780, 650),
      SalesData(DateTime(2011, 0, 1), 'Germany', 8.5, 70, 84, 450, 800),
      SalesData(DateTime(2012, 0, 1), 'Italy', 9.6, 78, 96, 500, 900),
      SalesData(DateTime(2013, 0, 1), 'Sweden', 10.8, 80, 106, 600, 750),
      SalesData(DateTime(2014, 0, 1), 'UK', 11.8, 87, 115, 700, 800),
      SalesData(DateTime(2015, 0, 1), 'Latvia', 13.5, 95, 130, 800, 900),
      SalesData(DateTime(2016, 0, 1), 'Denmark', 15.8, 102, 145, 900, 950),
    ];
    return <SplineAreaSeries<SalesData, num>>[
      SplineAreaSeries<SalesData, num>(
          dataSource: chartData,
          xValueMapper: (SalesData sales, _) => sales.sales2,
          yValueMapper: (SalesData sales, _) => sales.sales1,
          borderWidth: 3,
          borderDrawMode: BorderDrawMode.top,
          borderColor: MyTheme.cyan,
          enableTooltip: true,
          gradient: MyTheme.cyanGradient,
          dataLabelSettings: const DataLabelSettings(
              labelPosition: ChartDataLabelPosition.inside)),
      SplineAreaSeries<SalesData, num>(
          dataSource: chartData,
          xValueMapper: (SalesData sales, _) => sales.sales2,
          borderWidth: 3,
          borderDrawMode: BorderDrawMode.top,
          borderColor: MyTheme.blue,
          // color: MyTheme.blue,
          gradient: MyTheme.blueGradient,
          yValueMapper: (SalesData sales, _) => sales.sales2,
          dataLabelSettings: const DataLabelSettings(
            color: Colors.white,
          ))
    ];
  }

  @override
  State<SyncfusionTrendlineWidget> createState() =>
      _SyncfusionTrendlineWidgetState();
}

class _SyncfusionTrendlineWidgetState extends State<SyncfusionTrendlineWidget> {
  String deb = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(deb),
        Center(
            child: SfCartesianChart(
          crosshairBehavior: CrosshairBehavior(
              enable: true,
              lineColor: MyTheme.purple,
              lineWidth: 3,
              activationMode: ActivationMode.singleTap,
              lineType: CrosshairLineType.vertical),
          series: SyncfusionTrendlineWidget.getDefaultData(),

          tooltipBehavior: TooltipBehavior(enable: true, color: Colors.red),
          // onChartTouchInteractionDown: (tapArgs) {
          //   setState(() {
          //     deb = tapArgs.position.dx.toString();
          //   });
          // },
          // onChartTouchInteractionMove: (tapArgs) {
          //   setState(() {
          //     deb = tapArgs.position.dx.toString();
          //   });
          // },
        )),
      ],
    );
  }
}
