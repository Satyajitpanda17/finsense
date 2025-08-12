import 'package:finsense/data/model/add_data.dart';
import 'package:finsense/data/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
   int indexx;
  Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<AddData> a;
  bool b = true;
  bool j = true;

  @override
  void initState() {
    super.initState();
    switch (widget.indexx) {
      case 0:
        a = today();
        print(a);
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        print(a); 
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
     if (a.isEmpty) {
      return const Center(child: Text("No chart data available"));
    }

    List<int> yValues = time(a, b);
    List<SalesData> chartData = List.generate(yValues.length, (index) {
      String label;
      DateTime dt = a![index].datetime;

      if (j) {
        label = b ? dt.hour.toString() : dt.day.toString();
      } else {
        label = dt.month.toString();
      }

      return SalesData(label, yValues[index]);
    });
    // return Container(
    //      width: double.infinity,
    //   height: 300,
    //   child: SfCartesianChart(
    //     primaryXAxis: CategoryAxis(),
    //     series: <SplineSeries<SalesData, String>>[
    //       SplineSeries<SalesData, String>(
    //         color: Color.fromARGB(255, 47, 125, 121),
    //         width: 3,
    //         dataSource: <SalesData>[
    //           ...List.generate(time(a!, b ? true : false).length, (index) {
    //             return SalesData(
    //                 j
    //                     ? b
    //                         ? a![index].datetime.hour.toString()
    //                         : a![index].datetime.day.toString()
    //                     : a![index].datetime.month.toString(),
    //                 b
    //                     ? index > 0
    //                         ? time(a!, true)[index] + time(a!, true)[index - 1]
    //                         : time(a!, true)[index]
    //                     : index > 0
    //                         ? time(a!, false)[index] +
    //                             time(a!, false)[index - 1]
    //                         : time(a!, false)[index]);
    //           })
    //         ],
    //         xValueMapper: (SalesData sales, _) => sales.year,
    //         yValueMapper: (SalesData sales, _) => sales.sales,
    //       )
    //     ],
    //   ),
    //   );
  
  return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(
          text: _getTitle(),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
   String _getTitle() {
    switch (widget.indexx) {
      case 0:
        return "Today's Transactions";
      case 1:
        return "This Week's Transactions";
      case 2:
        return "This Month's Transactions";
      case 3:
        return "This Year's Transactions";
      default:
        return "Transactions";
    }
  }
}




class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}