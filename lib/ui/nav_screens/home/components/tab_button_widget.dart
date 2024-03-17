import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/dependency/navigation/global_router_exports.dart';
import 'package:one_cask/ui/nav_screens/home/home_cubit.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/text_styles.dart';

class TabButtonsWidget extends StatelessWidget {
  const TabButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration:
              BoxDecoration(color: kPrimaryB, borderRadius: borderRadius1),
          child: Row(
            children: [
              TabChipWidget(
                title: 'Details',
                isSelected: state.tabType == details,
                onTap: () => context.read<HomeCubit>().changeTab(tab: details),
              ),
              TabChipWidget(
                title: 'Tasting notes',
                isSelected: state.tabType == tasting,
                onTap: () => context.read<HomeCubit>().changeTab(tab: tasting),
              ),
              TabChipWidget(
                title: 'History',
                isSelected: state.tabType == history,
                onTap: () => context.read<HomeCubit>().changeTab(tab: history),
              )
            ],
          ),
        );
      },
    );
  }
}

class TabChipWidget extends StatelessWidget {
  const TabChipWidget(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(
              horizontal: spacingPadding2,
              vertical: spacingPadding1),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected ? kSecondaryColor : Colors.transparent,
              borderRadius: borderRadius1),
          child: Text(title,
              style: mediumText(
                  fontSize: 13,
                  color: isSelected ? kPrimaryColor : kWhite.withAlpha(150))),
        ),
      ),
    );
  }
}
