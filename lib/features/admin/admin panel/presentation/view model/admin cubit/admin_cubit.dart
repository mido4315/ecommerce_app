import 'package:ecommerce_app/features/admin/admin%20orders/data/repos/admin_orders_repo.dart';
import 'package:ecommerce_app/features/admin/admin%20orders/presentation/view%20model/admin_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/api_service.dart';
import '../../../../../../core/utils/service_locator.dart';
import '../../../../admin orders/presentation/views/admin_orders_view.dart';
import '../../../../posts/data/repos/posts_repo_impl.dart';
import '../../../../posts/presentation/view model/posts cubit/posts_cubit.dart';
import '../../../../posts/presentation/views/posts_view.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  int bottomNavigationBarCurrentIndex = 1;

  void changeTap(newIndex) {
    bottomNavigationBarCurrentIndex = newIndex;
    emit(AdminChangeTap());
  }

  final List<IconData> listOfIcons = [
    Icons.post_add,
    Icons.analytics,
    Icons.all_inbox_rounded,
  ];

  final List<String> listOfStrings = [
    'Posts',
    'Analytics',
    'Items',
  ];
  final List<Widget> layoutPages = [
    BlocProvider(
      create: (context) =>
          PostsCubit(PostsRepoImpl(getIt.get<APIService>()))..getProducts(),
      child: const PostsView(),
    ),
    const Center(
      child: Text(
        'Analytics Page',
        style: TextStyle(fontSize: 40),
      ),
    ),
    BlocProvider(
      create: (context) =>
          AdminOrdersCubit(AdminOrdersRepo(getIt.get<APIService>()))
            ..getOrders(),
      child: const AdminOrdersView(),
    ),
  ];
}