import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          color: AppTheme.white,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            itemCount: 3,
            itemBuilder: (context, index) => const ProductCard(),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
        bottom: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            //? ----------------
            ImageCon(),

            //? ----------------
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemoveBtn(),
                    Title(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Counter(),
                        Price(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCon extends StatelessWidget {
  const ImageCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthUsingMQ(context, 0.25),
      width: widthUsingMQ(context, 0.25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
    );
  }
}

class RemoveBtn extends StatelessWidget {
  const RemoveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.close_outlined,
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Text('Vanilla Ice Cream'),
    );
  }
}

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "RS 500.00",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //? --------------
        CounterBtn(
          icons: Icons.remove,
          iconColor: Colors.black,
          backColor: AppTheme.ASH,
          onTap: () {},
        ),

        //? --------------
        const SizedBox(
          width: 40,
          child: Center(
            child: Text('10'),
          ),
        ),

        //? --------------
        CounterBtn(
          icons: Icons.add,
          iconColor: Colors.white,
          backColor: Theme.of(context).primaryColor,
          onTap: () {},
        ),
      ],
    );
  }
}

class CounterBtn extends StatelessWidget {
  final IconData icons;
  final Color iconColor;
  final Color backColor;
  final void Function()? onTap;
  const CounterBtn({
    super.key,
    required this.icons,
    required this.iconColor,
    required this.backColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backColor,
        ),
        child: Icon(
          icons,
          color: iconColor,
        ),
      ),
    );
  }
}
