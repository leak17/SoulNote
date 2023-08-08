import 'package:diary_journal/core/bases/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget{
  const ViewModelProvider({
    Key? key,
    required this.create,
    this.child,
    required this.builder
  }): super(key: key);

  final Create<T> create;
  final Widget? child;
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => create(context),
      child: child,
      builder: (context, child){
        T viewModel = Provider.of<T>(context);
        return builder(context, viewModel, child);
      },
    );
  }

}
