import 'package:flutter/material.dart';
import 'package:syncfusion_test/custom/theme.dart';

class MetricWidget extends StatelessWidget {
  const MetricWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 160,
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0xffD1DFF7),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  const Text(
                    'საერთო მოგება',
                    style: TextStyle(fontSize: 16, color: MyTheme.darkBlue),
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.fromLTRB(14, 0, 7, 14),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14)),
                        color: MyTheme.secondarySurface),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton.filledTonal(
                            color: const Color(0xff25aa5a),
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xffdeefed),
                            ),
                            iconSize: 40,
                            icon: const Icon(
                              Icons.attach_money_rounded,
                            ),
                            onPressed: () {},
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('000,000',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff174159),
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 14, 14),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomRight: Radius.circular(14)),
                        color: MyTheme.secondarySurface),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton.filledTonal(
                                    style: IconButton.styleFrom(
                                      shape: const CircleBorder(),
                                      backgroundColor: const Color(0xfff5d5da),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    iconSize: 30,
                                    padding: const EdgeInsets.all(0),
                                    constraints: const BoxConstraints(),
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.arrow_downward_rounded,
                                        color: Color(0xffFF4E4E))),
                                const Text(
                                  '0.00%',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xffFF4E4E),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          const Text('(000,000)',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
