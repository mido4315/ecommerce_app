/// Package import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/sales_model.dart';
import '../../view model/analytics_cubit.dart';

/// Local imports

class AnalyticsColumnChart extends StatefulWidget {
  const AnalyticsColumnChart({
    Key? key,
    required this.sales,
    required this.totalSales,
  }) : super(key: key);

  final List<Sales> sales;
  final double totalSales;

  @override
  State<AnalyticsColumnChart> createState() => _AnalyticsColumnChartState();
}

class _AnalyticsColumnChartState extends State<AnalyticsColumnChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
  }

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: FlutterToggleTab(
            width: 88.w,
            borderRadius: 30,
            height: 37.h,
            selectedIndex: selectedIndex,
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            unSelectedTextStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            labels: const ['small', 'medium', 'large'],
            selectedLabelIndex: (index) {
              setState(() {
                selectedIndex = index;
                switch (index) {
                  case 0:
                    context.read<AnalyticsCubit>().tabTextIndexSelected = 1;
                    break;
                  case 1:
                    context.read<AnalyticsCubit>().tabTextIndexSelected = 2;
                    break;
                  case 2:
                    context.read<AnalyticsCubit>().tabTextIndexSelected = 4;
                    break;
                }
              });
            },
            isScroll: false,
          ),
        ),
        SizedBox(
          height: 400.h,
          child: _buildDefaultColumnChart(),
        ),
      ],
    );
  }

  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      enableAxisAnimation: true,
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Sales Analytics'),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),
      primaryXAxis: CategoryAxis(
        visibleMinimum: 0,
        visibleMaximum:
            context.read<AnalyticsCubit>().tabTextIndexSelected.toDouble(),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}\$',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Get default column series
  List<ColumnSeries<Sales, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<Sales, String>>[
      ColumnSeries<Sales, String>(
        dataSource: widget.sales,
        xValueMapper: (datum, index) => datum.label,
        yValueMapper: (datum, index) => datum.totalSale,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}