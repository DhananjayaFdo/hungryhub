import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';
import 'package:hungyhub/src/features/other/domain/entity/db/product.dart';
import 'package:hungyhub/src/features/other/screens/cart/bloc/cart/cart_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
            child: (() {
          switch (state.runtimeType) {
            case CartLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );

            case CartLoadedState:
              var success = state as CartLoadedState;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  color: AppTheme.white,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    itemCount: success.items.length,
                    itemBuilder: (context, index) => ProductCard(item: success.items[index]),
                  ),
                ),
              );

            case CartEmptyState:
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Container(
                  color: AppTheme.white,
                  child: const Center(
                    child: Text('Cart is Empty'),
                  ),
                ),
              );

            case CartErrorState:
              return const SizedBox();

            default:
              return const SizedBox();
          }
        }()));
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final CartItem item;

  const ProductCard({super.key, required this.item});

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
        child: Row(
          children: [
            //? ----------------
            ImageCon(item: item),

            //? ----------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemoveBtn(item: item),
                    Title(item: item),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Counter(item: item),
                        Price(item: item),
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
  final CartItem item;

  const ImageCon({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: widthUsingMQ(context, 0.25),
        width: widthUsingMQ(context, 0.25),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        child: CachedNetworkImage(
          imageUrl: item.image ?? '',
          imageBuilder: (context, imageProvider) => Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.fastfood_outlined, color: AppTheme.white),
        ),
      ),
    );
  }
}

class RemoveBtn extends StatelessWidget {
  final CartItem item;

  const RemoveBtn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          if (item.id != null) {
            context.read<CartBloc>().add(
                  CartItemRemoveClickEvent(id: item.id!),
                );
          }
        },
        child: const Icon(
          Icons.close_outlined,
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final CartItem item;

  const Title({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Text(item.name ?? ''),
    );
  }
}

class Price extends StatelessWidget {
  final CartItem item;

  const Price({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "RS ${item.price ?? ''}.00",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final CartItem item;

  const Counter({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //? --------------
        CounterBtn(
            icons: Icons.remove,
            iconColor: Colors.black,
            backColor: AppTheme.ASH,
            onTap: () {
              if (item.id != null) {
                context.read<CartBloc>().add(
                      CartItemIncreaseDecreaseEvent(
                        isIncrease: false,
                        id: item.id!,
                      ),
                    );
              }
            }),

        //? --------------
        SizedBox(
          width: 40,
          child: Center(
            child: Text('${item.quantity}'),
          ),
        ),

        //? --------------
        CounterBtn(
          icons: Icons.add,
          iconColor: Colors.white,
          backColor: Theme.of(context).primaryColor,
          onTap: () {
            if (item.id != null) {
              context.read<CartBloc>().add(
                    CartItemIncreaseDecreaseEvent(
                      isIncrease: true,
                      id: item.id!,
                    ),
                  );
            }
          },
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
