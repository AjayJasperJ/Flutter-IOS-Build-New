import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/cart/cubit/cart_cubit.dart';
import 'package:cubit_zero_to_pro/cart/widget/cart_list_view_widget.dart';
import 'package:cubit_zero_to_pro/home/ui/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      buildWhen: (previous, current) => current is CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoadedSuccessActionState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("CartScreen"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
            body: ListView.builder(
              itemCount: cartitems.length,
              itemBuilder: (context, index) {
                return CartListViewWidget(
                  productlist: cartitems[index],
                  height: 130,
                );
              },
            ),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
