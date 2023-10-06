import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logique/presentation/home/bloc/home_bloc.dart';
import 'package:logique/presentation/home/ui/home_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: IndexedStack(
          index: context.read<HomeBloc>().state.index.data,
          children: [
           const HomeScreen(),
           Container(),
           Container(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (value) {
            context.read<HomeBloc>().add(HomeOnTab(index: value));
          },
          currentIndex: context.read<HomeBloc>().state.index.data ?? 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Colors.blue,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Colors.white,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "News"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                label: "Favorite"
            )
          ],
        ),
      ),
    );
  },
);
  }
}
