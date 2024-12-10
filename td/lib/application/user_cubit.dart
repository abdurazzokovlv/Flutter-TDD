part  'user_state.dart';

import 'package:bloc/bloc.dart';
import 'package:td/service/service.dart';


class UserCubit extends Cubit<UserState> {
  final UserService _userService; 

  UserCubit(this._userService) : super(UserInitial()) {
    getUsers();
  }

  Future<void> getUsers() async {
    emit(const UserLoadingState()); 

    var response = await _userService.getUsers();

    response.fold(
      (l) {
        emit(UserErrorState(l));
      },
      (r) {
        emit(UserComplete(r));
      },
    );
  }
}
