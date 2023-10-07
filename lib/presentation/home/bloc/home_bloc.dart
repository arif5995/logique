import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:logique/controller/network/network_controller.dart';
import 'package:logique/model/post_model.dart';
import 'package:logique/model/user_model.dart';
import 'package:logique/utils/state/view_data_state.dart';
import 'package:stream_transform/stream_transform.dart';

part 'home_event.dart';

part 'home_state.dart';

int _page = 0;
List<User> listUser = [];
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NetworkController networkController;

  HomeBloc({required this.networkController})
      : super(
          HomeState(
            dataUser: ViewData.initial(),
            hasReachedMax: ViewData.loaded(data: false),
            index: ViewData.initial(),
            detailUser: ViewData.initial(),
            listPost: ViewData.initial(),
          ),
        ) {
    on<HomeLoaded>((event, emit) async {
      final reachedMax = state.hasReachedMax.data;
      if (!reachedMax!) {
        emit(
          state.copyWith(
            dataUser: ViewData.loading(),
          ),
        );
      }
      try {
        final data = await networkController.getDataUser(page: _page);
        if (data.isEmpty) {
          emit(state.copyWith(
              dataUser: ViewData.noData(message: "No Data"),
              hasReachedMax: ViewData.loaded(data: true)));
        } else {
          _page += 1;
          listUser = List.of(state.dataUser.data ?? [])..addAll(data);
          emit(state.copyWith(hasReachedMax: ViewData.loaded(data: false)));
        }

        return emit(state.copyWith(
          dataUser: ViewData.loaded(data: listUser),
        ));
      } catch (e) {
        emit(
          state.copyWith(
            dataUser: ViewData.error(
              message: "Gagal get data user",
            ),
          ),
        );
      }
    });

    on<HomeOnTab>(
      (event, emit) => emit(
        state.copyWith(
          index: ViewData.loaded(data: event.index),
        ),
      ),
    );

    on<HomeUserDetail>((event, emit) async {
      final response = await networkController.getDataUserById(idUser: event.idUser);
      return emit(state.copyWith(detailUser: ViewData.loaded(data: response)));
    });

    on<HomeListPost>((event, emit) async {
      final response = await networkController.getDataPostById(idUser: event.idUser);
      return emit(state.copyWith(listPost: ViewData.loaded(data: response)));
    });

  }
}
