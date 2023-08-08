import 'package:diary_journal/core/bases/view_model_provider.dart';
import 'package:diary_journal/views/home/home_model.dart';
import 'package:diary_journal/views/home/home_view.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends StatelessWidget{
  const HomeViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeModel>(
      create: (context) => HomeModel(),
      builder: (context, viewModel, child){
        return HomeView(viewModel: viewModel);
      }
    );
  }
}
