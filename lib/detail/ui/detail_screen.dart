import 'package:cubit_zero_to_pro/Api/product_data_model/product_data_model.dart';
import 'package:cubit_zero_to_pro/detail/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final ProductDataModel productdetail;

  const DetailScreen({super.key, required this.productdetail});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.amberAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(widget.productdetail.itemimage)),
                    color: Colors.grey.shade900),
              ),
            ),
            Text(widget.productdetail.itemname),
            Text(widget.productdetail.itemdescription.length < 200
                ? widget.productdetail.itemdescription
                : "${widget.productdetail.itemdescription.substring(0, 200)}......"),
            InkWell(
              onTap: () {
                BlocProvider.of<DetailCubit>(context)
                    .addtocart(widget.productdetail);
              },
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade900),
                  child: const Center(
                      child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.amberAccent),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
