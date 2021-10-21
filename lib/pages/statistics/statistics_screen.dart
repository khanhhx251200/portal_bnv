import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/pages/statistics/components/chart_with_month/chart_with_month.dart';
import 'package:app_mobile/pages/statistics/components/line_chart/line_chart.dart';
import 'package:app_mobile/pages/statistics/components/pie_chart/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key key}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kPrimaryColors,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  'Thống kê theo năm',
                  style: GoogleFonts.roboto(
                      color: kWhiteColors, fontWeight: FontWeight.bold),
                ),
                ChartWithMonth(),
                Text(
                  'Thống kê theo %',
                  style: GoogleFonts.roboto(
                      color: kWhiteColors, fontWeight: FontWeight.bold),
                ),
                PieChartCircle(),
                Text(
                  'Thống kê theo đường dẫn',
                  style: GoogleFonts.roboto(
                      color: kWhiteColors, fontWeight: FontWeight.bold),
                ),
                LineChartInYear(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
