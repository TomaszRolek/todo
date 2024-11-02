import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../services/router/app_router.dart';
import '../../../services/router/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/sort_enum.dart';
import '../../../utils/state_status.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/dashboard_wrapper.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  SortEnum dropdownValue = SortEnum.nameAsc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.status == StateStatus.loading) {
          return Center(child: CircularProgressIndicator(color: AppColors.whiteColor));
        } else if (state.status == StateStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Center(
                        child: Text(
                      S.current.error_occured,
                      style: AppTextStyles.bold16,
                    )),
                  )),
              margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / 6, right: 48, left: 48),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
            ),
          );
        }
        return DashboardWrapper(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.current.users,
                                  style: AppTextStyles.bold24.copyWith(color: AppColors.whiteColor),
                                ),
                                ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<SortEnum>(
                                      borderRadius: BorderRadius.circular(8),
                                      style: AppTextStyles.bold14.copyWith(color: AppColors.redColor),
                                      dropdownColor: AppColors.whiteColor,
                                      value: dropdownValue,
                                      items: [
                                        DropdownMenuItem(
                                          value: SortEnum.dateDesc,
                                          child: Text(SortEnum.dateDesc.serverValue),
                                        ),
                                        DropdownMenuItem(
                                          value: SortEnum.dateAsc,
                                          child: Text(SortEnum.dateAsc.serverValue),
                                        ),
                                        DropdownMenuItem(
                                          value: SortEnum.nameDesc,
                                          child: Text(SortEnum.nameDesc.serverValue),
                                        ),
                                        DropdownMenuItem(
                                          value: SortEnum.nameAsc,
                                          child: Text(SortEnum.nameAsc.serverValue),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        context.read<DashboardBloc>().add(
                                              LoadDataEvent(
                                                order: (value as SortEnum).order(),
                                                sortBy: value.sortBy(),
                                              ),
                                            );
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            //TODO:apply pagination eg paged list view with infinite_scroll_pagination package
                            ...state.users.map(
                              (user) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: GestureDetector(
                                  onTap: () => context
                                      .read<AppRouter>()
                                      .router
                                      .pushNamed(AppRoutes.userDetails, extra: {'userId': user.id}),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.white, width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.name,
                                            style: AppTextStyles.bold14.copyWith(color: AppColors.whiteColor),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            user.email,
                                            style: AppTextStyles.normal14.copyWith(color: AppColors.redColor),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            user.createdDate,
                                            style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
