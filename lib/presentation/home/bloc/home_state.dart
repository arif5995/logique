part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ViewData<List<User>> dataUser;
  final ViewData<bool> hasReachedMax;
  final ViewData<int> index;

  const HomeState({
    required this.dataUser,
    required this.hasReachedMax,
    required this.index
  });

  HomeState copyWith({
    ViewData<List<User>>? dataUser,
    ViewData<bool>? hasReachedMax,
    ViewData<int>? index
  }) {
    return HomeState(
        dataUser: dataUser ?? this.dataUser,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        index: index ?? this.index
    );
  }

  @override
  List<Object> get props => [dataUser, hasReachedMax, index];
}
