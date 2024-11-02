part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class LoadDataEvent extends DashboardEvent {
  final String order;
  final String sortBy;
  final int page;

  const LoadDataEvent({required this.order, required this.sortBy, this.page = 1});

  @override
  List<Object> get props => [order, sortBy, page];
}
