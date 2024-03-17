import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/ui/global_components/bottom_nav_widget.dart';
import 'package:one_cask/ui/nav_screens/home/home.dart';
import 'package:one_cask/ui/nav_screens/home/home_cubit.dart';
import 'package:one_cask/utils/colors.dart';

final isBottomNavVisible = ValueNotifier(true);

class Domain extends StatefulWidget {
  const Domain({super.key});

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().checkInternet();
  }

  Widget bottomPages({required int index}) {
    final bottomPages = [
      const Home(),
      const Home(),
      const Home(),
      const Home()
    ];
    return bottomPages[index];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: ValueListenableBuilder(
            valueListenable: pagePosition,
            builder: (context, value, child) {
              return Scaffold(
                backgroundColor: kPrimaryB,
                bottomNavigationBar: const BottomNavWidget(),
                body: bottomPages(index: value),
              );
            }));
  }
}
