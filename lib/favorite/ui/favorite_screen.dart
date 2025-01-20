import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/favorite/cubit/favorite_cubit.dart';
import 'package:cubit_zero_to_pro/favorite/widget/fav_list_view_widget.dart';
import 'package:cubit_zero_to_pro/home/ui/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) => current is FavoriteActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FavLoadedSuccessActionState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("FavoriteScreen"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
            body: ListView.builder(
              itemCount: favoriteitems.length,
              itemBuilder: (context, index) {
                return FavListViewWidget(
                  productlist: favoriteitems[index],
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
