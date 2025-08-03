import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 300,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <SplineSeries<SalesData, String>>[
            SplineSeries<SalesData, String>(
               color: Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData('Mon', 200),
              SalesData('Tue', 100),
              SalesData('Wed', 300),
              SalesData('Thrus', 100),
              SalesData('Fri', 400),
              SalesData('Sat', 50),
              SalesData('Sun', 300),
            ],
             xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            )
          ],
        ),
      ),
    );
  }
}


class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}