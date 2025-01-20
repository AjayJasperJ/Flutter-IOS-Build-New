import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:cubit_zero_to_pro/cart/cubit/cart_cubit.dart';
import 'package:cubit_zero_to_pro/cart/ui/cart_screen.dart';
import 'package:cubit_zero_to_pro/detail/cubit/detail_cubit.dart';
import 'package:cubit_zero_to_pro/detail/ui/detail_screen.dart';
import 'package:cubit_zero_to_pro/favorite/cubit/favorite_cubit.dart';
import 'package:cubit_zero_to_pro/favorite/ui/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  navigatePush(int Pageid) {
    if (Pageid == 1) {
      emit(ToggleScreenState(
          Targetpage: BlocProvider(
        create: (context) => CartCubit(),
        child: const CartScreen(),
      )));
    } else if (Pageid == 2) {
      emit(ToggleScreenState(
          Targetpage: BlocProvider(
        create: (context) => FavoriteCubit(),
        child: const FavoriteScreen(),
      )));
    }
  }

  initialpage() async {
    emit(LoadingActionState());
    try {
      final assigndata = await Api().listdata();
      final mappedlist = assigndata
          .map((i) => ProductDataModel(
              itemindex: i['idCategory'],
              itemname: i['strCategory'],
              itemimage: i['strCategoryThumb'],
              itemdescription: i['strCategoryDescription']))
          .toList();

      emit(LoadingSuccessActionState(listdata: mappedlist));
    } catch (e) {
      print(e);
    }
  }

  insertitem(ProductDataModel item) {
    favoriteitems.add(item);
  }

  gotodetail(ProductDataModel productdetail) {
    emit(ToggleScreenState(
        Targetpage: BlocProvider(
      create: (_) => DetailCubit(),
      child: DetailScreen(productdetail: productdetail),
    )));
  }
}
