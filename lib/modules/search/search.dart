import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/stats.dart';

class SearchScrren extends StatelessWidget {
  const SearchScrren({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).search;
        TextEditingController input = TextEditingController();
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: input,
                  onChanged: (value) {
                    print(value);
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(
                    label: Text('Search'),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can not Be Empty";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
