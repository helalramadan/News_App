import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/stats.dart';

class News_Layout extends StatelessWidget {
  const News_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            body: cubit.screen[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomBarItem,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.bottomSheet(index);
              },
            ),
          );
        },
      ),
    );
  }
}
