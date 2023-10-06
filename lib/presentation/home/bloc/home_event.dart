part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeLoaded extends HomeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeOnTab extends HomeEvent{
  final int index;

  HomeOnTab({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];

}
