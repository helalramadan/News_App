import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';

import 'cubit/cubit.dart';
import 'cubit/stats.dart';

class News_Layout extends StatelessWidget {
  const News_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScrren()));
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit.changeTheme();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cubit.screen[cubit.currentindex],
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   child: const Icon(Icons.add),
            // ),
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
