import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

import '../../../../../core/widgets/widgets.dart';

class CusSearchBar extends StatefulWidget {
  const CusSearchBar({super.key});

  @override
  State<CusSearchBar> createState() => _CusSearchBarState();
}

class _CusSearchBarState extends State<CusSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Container(
        padding: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
        decoration: const BoxDecoration(
          color: AppTheme.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 10),
          ],
        ),
        child: const SafeArea(
          bottom: false,
          child: Row(
            children: [
              //? -----------
              NavBarBackBtn(),

              //? -----------
              SearchFiled(),

              //? -----------
              ClearBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearBtn extends StatelessWidget {
  const ClearBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      width: 40,
      child: Icon(
        Icons.close_outlined,
        size: 25,
        color: AppTheme.BLUE,
      ),
    );
  }
}

class SearchFiled extends StatefulWidget {
  const SearchFiled({super.key});

  @override
  State<SearchFiled> createState() => _SearchFiledState();
}

class _SearchFiledState extends State<SearchFiled> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          autocorrect: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
                ),
          ),
        ),
      ),
    );
  }
}
