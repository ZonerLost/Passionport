import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';

class ProjectionVsActualsChart extends StatefulWidget {
  ProjectionVsActualsChart({super.key});

  List<Color> get availableColors => const <Color>[
    Colors.orange,
    Colors.orangeAccent,
    Color(0xFFFF8C00),
    Color(0xFFFF7F00),
    Color(0xFFFF6600),
    Color(0xFFFF5500),
  ];

  final Color projectionColor = const Color(0xFFFFE0CC); // Light orange for projections
  final Color actualColor = Colors.orange; // Orange for actuals
  final Color touchedBarColor = const Color(0xFFFF5500);

  @override
  State<StatefulWidget> createState() => ProjectionVsActualsChartState();
}

class ProjectionVsActualsChartState extends State<ProjectionVsActualsChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AspectRatio(
            aspectRatio: 1.5,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        duration: animDuration,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        bool isProjection = false,
        Color? barColor,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    Color finalBarColor;
    if (barColor != null) {
      finalBarColor = barColor;
    } else if (isProjection) {
      finalBarColor = widget.projectionColor;
    } else {
      finalBarColor = widget.actualColor;
    }

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 0.5 : y,
          color: isTouched ? widget.touchedBarColor : finalBarColor,
          width: width,
          borderRadius: BorderRadius.circular(11), // Rounded bars like in image
          borderSide: isTouched
              ? const BorderSide(color: Colors.black26)
              : BorderSide.none,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (i) {
    switch (i) {
      case 0: // Jan
        return makeGroupData(0, 8, isTouched: i == touchedIndex);
      case 1: // Feb (highlighted with frame)
        return makeGroupData(1, 15, isTouched: i == touchedIndex);
      case 2: // Mar (tallest)
        return makeGroupData(2, 18, isTouched: i == touchedIndex);
      case 3: // Apr
        return makeGroupData(3, 6, isTouched: i == touchedIndex);
      case 4: // May
        return makeGroupData(4, 10, isTouched: i == touchedIndex);
      case 5: // Jun (projection - lighter)
        return makeGroupData(5, 12, isTouched: i == touchedIndex, isProjection: true);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      maxY: 20,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.black87,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String monthName;
            switch (group.x) {
              case 0:
                monthName = 'Jan';
                break;
              case 1:
                monthName = 'Feb';
                break;
              case 2:
                monthName = 'Mar';
                break;
              case 3:
                monthName = 'Apr';
                break;
              case 4:
                monthName = 'May';
                break;
              case 5:
                monthName = 'Jun';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$monthName\n${rod.toY.toInt()}',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
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
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 1:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 3:
        text = const Text('Apr', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 5:
        text = const Text('Jun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      meta: meta,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      maxY: 20,
      barTouchData: const BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(6, (i) {
        return makeGroupData(
          i,
          Random().nextInt(15).toDouble() + 5,
          barColor: widget.availableColors[
          Random().nextInt(widget.availableColors.length)],
        );
      }),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}