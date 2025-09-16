part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeDoneState extends HomeState {
  const HomeDoneState(this.users);

  final List<User> users;
}

class HomeErrorState extends HomeState {
  const HomeErrorState(this.message);

  final String message;
}
