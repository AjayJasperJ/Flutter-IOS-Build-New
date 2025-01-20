import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:cubit_zero_to_pro/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListViewWidget extends StatelessWidget {
  final double height;
  final ProductDataModel productlist;

  const HomeListViewWidget(
      {super.key, required this.height, required this.productlist});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amberAccent),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(productlist.itemimage)),
                  color: Colors.grey.shade900),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Product ${productlist.itemindex}"),
                      Text(
                        productlist.itemname,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(productlist.itemdescription.substring(0, 20)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context)
                            .insertitem(productlist);
                      },
                      icon: const Icon(Icons.auto_awesome))
                ],
              ),
            )
          ],
        ));
  }
}
