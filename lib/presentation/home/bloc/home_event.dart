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

class HomeUserDetail extends HomeEvent{
  final String idUser;

  HomeUserDetail({required this.idUser});

  @override
  // TODO: implement props
  List<Object?> get props => [idUser];

}

class HomeListPost extends HomeEvent{
  final String idUser;

  HomeListPost({required this.idUser});

  @override
  // TODO: implement props
  List<Object?> get props => [idUser];

}

