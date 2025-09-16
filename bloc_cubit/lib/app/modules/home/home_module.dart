import 'package:estudo_bloc/app/modules/home/cubit/home_cubit.dart';
import 'package:estudo_bloc/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomePage(),
    );
  }
}
