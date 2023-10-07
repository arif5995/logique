part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ViewData<List<User>> dataUser;
  final ViewData<bool> hasReachedMax;
  final ViewData<int> index;
  final ViewData<User> detailUser;
  final ViewData<List<Post>> listPost;
  final ViewData<bool> isFriends;
  final ViewData<bool> isLikes;

  const HomeState({
    required this.dataUser,
    required this.hasReachedMax,
    required this.index,
    required this.detailUser,
    required this.listPost,
    required this.isFriends,
    required this.isLikes,
  });

  HomeState copyWith({
    ViewData<List<User>>? dataUser,
    ViewData<bool>? hasReachedMax,
    ViewData<int>? index,
    ViewData<User>? detailUser,
    ViewData<List<Post>>? listPost,
    ViewData<bool>? isFriends,
    ViewData<bool>? isLikes,
  }) {
    return HomeState(
        dataUser: dataUser ?? this.dataUser,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        index: index ?? this.index,
        detailUser: detailUser ?? this.detailUser,
        listPost: listPost ?? this.listPost,
        isFriends: isFriends ?? this.isFriends,
        isLikes: isLikes ?? this.isLikes
    );
  }

  @override
  List<Object> get props =>
      [dataUser, hasReachedMax, index, detailUser, listPost, isFriends, isLikes];
}
