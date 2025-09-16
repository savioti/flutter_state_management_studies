import 'package:estudo_bloc/app/modules/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estudo Cubit'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeDoneState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(state.users[i].name),
                  subtitle: Text(state.users[i].email),
                );
              },
            );
          }

          if (state is HomeErrorState) {
            return Center(child: Icon(Icons.error));
          }

          if (state is HomeLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return SizedBox();
        },
      ),
    );
  }
}
