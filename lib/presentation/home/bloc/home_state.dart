part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ViewData<List<User>> dataUser;
  final ViewData<bool> hasReachedMax;
  final ViewData<int> index;
  final ViewData<User> detailUser;
  final ViewData<List<Post>> listPost;

  const HomeState(
      {required this.dataUser,
      required this.hasReachedMax,
      required this.index,
      required this.detailUser,
      required this.listPost});

  HomeState copyWith({
    ViewData<List<User>>? dataUser,
    ViewData<bool>? hasReachedMax,
    ViewData<int>? index,
    ViewData<User>? detailUser,
    ViewData<List<Post>>? listPost,
  }) {
    return HomeState(
        dataUser: dataUser ?? this.dataUser,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        index: index ?? this.index,
        detailUser: detailUser ?? this.detailUser,
        listPost: listPost ?? this.listPost);
  }

  @override
  List<Object> get props =>
      [dataUser, hasReachedMax, index, detailUser, listPost];
}
