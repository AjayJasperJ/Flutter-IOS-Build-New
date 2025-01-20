import 'package:bloc/bloc.dart';
import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  updatedata() {
    emit(FavLoadedSuccessActionState());
  }

  deleteelement(ProductDataModel item) {
    favoriteitems.remove(item);
    emit(FavLoadedSuccessActionState());
  }
}
