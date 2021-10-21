import 'package:app_mobile/pages/statistics/components/data_fake/with_month_in_year.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWithMonth extends StatelessWidget {
  const ChartWithMonth({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroupsMonthFake,
            alignment: BarChartAlignment.spaceAround,
            maxY: 50,
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 1,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          margin: 4,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'T1';
              case 1:
                return 'T2';
              case 2:
                return 'T3';
              case 3:
                return 'T4';
              case 4:
                return 'T5';
              case 5:
                return 'T6';
              case 6:
                return 'T7';
              case 7:
                return 'T8';
              case 8:
                return 'T9';
              case 9:
                return 'T10';
              case 10:
                return 'T11';
              case 11:
                return 'T12';

              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

}
