import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logique/di/dependency.dart';
import 'package:logique/presentation/home/bloc/home_bloc.dart';
import 'package:logique/presentation/home/widget/bottom_loader.dart';
import 'package:logique/utils/navigation/router/home_router.dart';
import 'package:logique/utils/state/view_data_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final HomeRouter homeRouter = sl();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          final status = state.dataUser.status;
          if (status.isNoData){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("No Post"),
            ));
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.dataUser.status;
            if (status.isInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (status.isHasData) {
              final data = state.dataUser.data;
              return GridView.builder(
                  controller: _scrollController,
                  itemCount: data!.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: (1.44)),
                  itemBuilder: (ctx, index) {
                    final item = data[index];
                    return InkWell(
                      onTap: ()=> homeRouter.navigateToDetailHome(idUser: item.id),
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              item.picture ?? "",
                              fit: BoxFit.fill,
                              width: 200,
                              height: 90,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "${item.title}. ${item.firstName} ${item
                                    .lastName}"),
                          ],
                        ),
                      ),
                    );
                  });
            }
            if (status.isLoading) {
              return const BottomLoader();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeBloc>().add(HomeLoaded());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
