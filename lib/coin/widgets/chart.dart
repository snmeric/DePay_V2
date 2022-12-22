import 'package:depay_v2/coin/coin_constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../models/coin.dart';

class Chart extends StatelessWidget {
  Chart(
      {required this.data,
      Key? key,
      required this.blurRadius,
      required this.spreadRadius,
      this.opacity = 1,
      this.isDetailScreen = false})
      : super(key: key);
  Coin data;
  final double blurRadius;
  final double spreadRadius;
  final double opacity;
  final bool isDetailScreen;

  @override
  Widget build(BuildContext context) {
    //late List<ChartDataTest> dataTest;

    
    return Stack(
      children: [
        Container(
          
          child: SfSparkLineChart(
            trackball: isDetailScreen
                ? const SparkChartTrackball(
                    color: Colors.white,
                    activationMode: SparkChartActivationMode.tap)
                : null,
            axisLineWidth: 0,
            data: data.sparklineIn7D!.price,
            color: data.priceChangePercentage7DInCurrency! <= 0
                ? kRedColor
                : kGreenColor,
          ),
        ),
        // TextButton(
        //     onPressed: () {
        //       print(data.sparklineIn7D!.price.length);
        //     },
        //     child: Text('Yaz')),
        // Container(
        //   child: SfCartesianChart(
        //     margin: EdgeInsets.all(0),
        //     plotAreaBorderWidth: 0,
        //     borderWidth: 0,
        //     borderColor: Colors.transparent,
        //     primaryXAxis: NumericAxis(
        //         minimum: 0,
        //         maximum: 6,
        //         isVisible: false,
        //         interval: 1,
        //         borderWidth: 0,
        //         borderColor: Colors.transparent),
        //     primaryYAxis: NumericAxis(
        //         minimum: 0,
        //         maximum: 25,
        //         interval: 1000,
        //         isVisible: false,
        //         borderWidth: 0,
        //         borderColor: Colors.transparent),
        //     series: <ChartSeries>[
        //       SplineAreaSeries(
        //           dataSource: data.sparklineIn7D!.price,
        //           xValueMapper: (data, _) => data.sparklineIn7D!.price.length,
        //           yValueMapper: (data, _) =>
        //               data.sparklineIn7D!.price.length / 24)
        //     ],
        //   ),
        // ),
      ],
    );
  }
}



/*

  child: SfSparkLineChart(
         
            trackball: isDetailScreen
                ? const SparkChartTrackball(
                    color: Colors.white,
                    activationMode: SparkChartActivationMode.tap)
                : null,
            axisLineWidth: 0,
            data: data.sparklineIn7D!.price,
            color: data.priceChangePercentage7DInCurrency! <= 0
                ? kRedColor
                : kGreenColor,
          ),


        


 


*/
