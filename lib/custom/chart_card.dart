import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD1DFF7),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "სულ გაყიდვები",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF174159),
                ),
              ),
              Icon(
                Icons.star_border_rounded,
                color: Color(0xFF1861D5),
                size: 35,
              )
            ],
          ),
          child
        ],
      ),
    );
  }
}
