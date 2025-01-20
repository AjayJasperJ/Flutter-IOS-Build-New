import 'package:bloc/bloc.dart';
import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  updatedata() {
    emit(CartLoadedSuccessActionState());
  }

  deletedata(ProductDataModel item) {
    cartitems.remove(item);
    emit(CartLoadedSuccessActionState());
  }
}
