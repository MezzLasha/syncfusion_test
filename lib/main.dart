import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_test/custom/cartesian/flchart.dart';
import 'package:syncfusion_test/custom/cartesian/syncfusion.dart';
import 'package:syncfusion_test/custom/donut/synfusion.dart';
import 'package:syncfusion_test/custom/metric.dart';
import 'package:syncfusion_test/custom/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flchart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Test'),
        actions: [
          Switch(
              value: flchart,
              onChanged: (val) {
                setState(() {
                  flchart = val;
                });
              })
        ],
      ),
      body: PageView(
        children: [
          DonutSyncfusion(),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0xffD1DFF7),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      children: [
                        const Text(
                          'ხარჯები',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.darkBlue),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            iconSize: 40,
                            color: const Color(0xff1861D5),
                            icon: const Icon(Icons.star_border_rounded))
                      ],
                    ),
                  ),
                  SizedBox(
                      // height: 400, width: 400,
                      child: AnimatedCrossFade(
                          firstChild: const LineChartSample2(),
                          secondChild: const SyncfusionTrendlineWidget(),
                          crossFadeState: flchart
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          sizeCurve: Curves.easeInOutCubicEmphasized,
                          duration: const Duration(milliseconds: 500))),
                ],
              ),
            ),
          ),
          MetricWidget()
        ],
      ),
    );
  }
}