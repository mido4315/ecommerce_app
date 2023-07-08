import 'package:ecommerce_app/features/admin/analytics/presentation/view%20model/analytics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/analytics_column_chart.dart';
import 'widgets/total_analysis.dart';

class AnalyticView extends StatelessWidget {
  const AnalyticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsCubit, AnalyticsState>(
        builder: (context, state) {
      if (state is AnalyticsSuccess) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TotalAnalysis(
                    totalSales: state.totalSales.toString(),
                    totalOrders: state.totalOrders!.toInt().toString(),
                    totalProducts: state.totalProducts!.toInt().toString(),
                  ),
                ),
              ),
              AnalyticsColumnChart(
                sales: state.sales!,
                totalSales: state.totalSales!,
              ),
            ],
          ),
        );
      } else if (state is AnalyticsFailure) {
        return Center(
          child: Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 50),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}