import 'package:bloc/bloc.dart';
import 'package:estudo_bloc/app/shared/models/user.dart';
import 'package:estudo_bloc/app/shared/services/services_users.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    _listUsers();
  }

  final UsersService _usersService = UsersService();
  List<User> users;

  Future<void> _listUsers() async {
    try {
      emit(HomeLoadingState());
      users = await _usersService.getUsers();
      emit(HomeDoneState(users));
    } catch (e) {
      emit(HomeErrorState('ERRO: Lista de usuários não carregada.'));
    }
  }
}
