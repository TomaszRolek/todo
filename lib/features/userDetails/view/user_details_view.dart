import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../generated/l10n.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/sort_enum.dart';
import '../../../utils/state_status.dart';
import '../bloc/user_details_bloc.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key, required this.userId});

  final int userId;

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  SortEnum dropdownValue = SortEnum.nameAsc;
  int? filterIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.whiteColor),
            backgroundColor: AppColors.blackColor,
            title: Text(
              S.current.user_details,
              style: AppTextStyles.bold16.copyWith(color: AppColors.whiteColor),
            )),
        body: BlocListener<UserDetailsBloc, UserDetailsState>(
          listener: (context, state) {
            if (state.taskStatus == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.current.edit_task_success)),
              );
            } else if (state.taskStatus == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.current.edit_task_failure)),
              );
            }
            if (state.status == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.current.error_occured)),
              );
            }
            if (state.addTaskStatus == StateStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.current.add_task_success)),
              );
            } else if (state.addTaskStatus == StateStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.current.add_task_failure)),
              );
            }
          },
          child: state.user == null
              ? Center(child: CircularProgressIndicator(color: AppColors.whiteColor))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user!.name,
                                style: AppTextStyles.bold14.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.user!.email,
                                style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.user!.phone,
                                style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.user!.address,
                                style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.user!.createdDate,
                                style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.current.tasks, style: AppTextStyles.bold24.copyWith(color: AppColors.whiteColor)),
                          GestureDetector(
                            onTap: () => _showDialog(state.user!.id),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  S.current.add_task,
                                  style: AppTextStyles.bold14.copyWith(color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      ToggleSwitch(
                        minWidth: MediaQuery.sizeOf(context).width,
                        cornerRadius: 20.0,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: filterIndex,
                        doubleTapDisable: true,
                        totalSwitches: 2,
                        borderWidth: 2,
                        borderColor: [AppColors.redColor],
                        activeBgColor: [AppColors.redColor],
                        labels: [S.current.resolved, S.current.unresolved],
                        onToggle: (index) {
                          context.read<UserDetailsBloc>().add(
                                LoadDataEvent(
                                  filter: index == 0 ? S.current.resolved_en : S.current.unresolved_en,
                                  userId: widget.userId,
                                ),
                              );
                          filterIndex = index;
                        },
                      ),
                      const SizedBox(height: 10),
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
                              context.read<UserDetailsBloc>().add(
                                    LoadDataEvent(
                                      order: (value as SortEnum).order(),
                                      sortBy: value.sortBy(),
                                      userId: widget.userId,
                                    ),
                                  );
                              setState(() {
                                dropdownValue = value;
                              });
                            }),
                      ),
                      const SizedBox(height: 20),
                      if (state.status == StateStatus.loading)
                        Center(child: CircularProgressIndicator(color: AppColors.whiteColor))
                      else
                        //TODO:apply pagination eg paged list view with infinite_scroll_pagination package
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.userTasks.length,
                            itemBuilder: (context, index) {
                              final task = state.userTasks[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: task.status == S.current.unresolved_en
                                          ? AppColors.redColor
                                          : AppColors.whiteColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              task.description,
                                              style: AppTextStyles.bold14.copyWith(color: AppColors.whiteColor),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              task.createdDate,
                                              style: AppTextStyles.normal14.copyWith(color: AppColors.redColor),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              task.status,
                                              style: AppTextStyles.normal14.copyWith(color: AppColors.whiteColor),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () => context.read<UserDetailsBloc>().add(
                                                ChangeTaskStatusEvent(
                                                  userId: state.user!.id,
                                                  taskId: task.id,
                                                  status: task.status == S.current.resolved_en
                                                      ? S.current.unresolved_en
                                                      : S.current.resolved_en,
                                                ),
                                              ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              border: Border.all(color: Colors.white, width: 2),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                S.current.change_status,
                                                style: AppTextStyles.bold14.copyWith(color: AppColors.whiteColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      );
    });
  }

  _showDialog(int userId) {
    final descController = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: AlertDialog(
          title: Text(S.current.add_task),
          content: TextFormField(
            //TODO: add validator
            maxLines: 1,
            style: AppTextStyles.normal16.copyWith(color: AppColors.blackColor),
            controller: descController,
            decoration: InputDecoration(
              labelText: S.current.task_description,
              labelStyle: AppTextStyles.normal16.copyWith(color: AppColors.blackColor.withOpacity(0.5)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(S.current.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<UserDetailsBloc>().add(AddTaskEvent(userId: userId, description: descController.text));
                Navigator.of(dialogContext).pop();
              },
              child: Text(S.current.add),
            ),
          ],
        ),
      ),
    );
  }
}
