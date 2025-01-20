import 'package:bloc/bloc.dart';
import 'package:cubit_zero_to_pro/Api/ApiDB/api.dart';
import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:meta/meta.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  addtocart(ProductDataModel item) {
    cartitems.add(item);
  }
}
