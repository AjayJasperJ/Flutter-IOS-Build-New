import 'package:cubit_zero_to_pro/home/cubit/home_cubit.dart';
import 'package:cubit_zero_to_pro/home/ui/loading_screen.dart';
import 'package:cubit_zero_to_pro/home/widgets/home_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).initialpage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is ToggleScreenState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => state.Targetpage));
        }
      },
      builder: (context, state) {
        if (state is LoadingActionState) {
          return const LoadingScreen();
        } else if (state is LoadingSuccessActionState) {
          final successtate = state;
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.auto_awesome_mosaic_rounded,
                      color: Colors.grey.shade800,
                    )),
                title: const Text("HomeScreen"),
                actions: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context).navigatePush(1);
                      },
                      icon: const Icon(Icons.shopping_bag_rounded)),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context).navigatePush(2);
                      },
                      icon: const Icon(Icons.auto_awesome_rounded))
                ],
              ),
              body: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: successtate.listdata.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context)
                        .gotodetail(successtate.listdata[index]);
                  },
                  child: HomeListViewWidget(
                    height: 130,
                    productlist: successtate.listdata[index],
                  ),
                ),
              ));
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
