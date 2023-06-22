import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/api_service.dart';
import '../../../../../../core/utils/service_locator.dart';
import '../../../../posts/data/repos/posts_repo_impl.dart';
import '../../../../posts/presentation/view model/add new product cubit/add_new_product_cubit.dart';
import '../../../../posts/presentation/views/add_new_product.dart';
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
          PostsCubit(PostsRepoImpl(getIt.get<APIService>())),
      child: const PostsView(),
    ),
    const Center(
      child: Text(
        'Analytics Page',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'Items Page',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];
}