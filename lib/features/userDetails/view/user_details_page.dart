import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/app_repository.dart';
import 'package:todo/features/userDetails/bloc/user_details_bloc.dart';
import 'package:todo/features/userDetails/view/user_details_view.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.appRepository, required this.userId});

  final AppRepository appRepository;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserDetailsBloc(appRepository)..add(LoadDataEvent(userId: userId, initialLoad: true, page: 1)),
      child: UserDetailsView(userId: userId),
    );
  }
}
