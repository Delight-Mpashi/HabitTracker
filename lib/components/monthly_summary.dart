import 'package:flutter/material.dart';
import 'package:flutter_application_1/datetime/date_time.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(10, 239, 7, 224),
          2: Color.fromARGB(20, 239, 7, 224),
          3: Color.fromARGB(30, 239, 7, 224),
          4: Color.fromARGB(40, 239, 7, 224),
          5: Color.fromARGB(50, 239, 7, 224),
          6: Color.fromARGB(60, 239, 7, 224),
          7: Color.fromARGB(70, 239, 7, 224),
          8: Color.fromARGB(80, 239, 7, 224),
          9: Color.fromARGB(90, 239, 7, 224),
          10: Color.fromARGB(100, 239, 7, 224),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
