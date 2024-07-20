import 'package:flutter/material.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => ItemCard(),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        // splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          constraints: BoxConstraints(minHeight: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken Biriyani',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
        ),
      ),
    );
  }
}
