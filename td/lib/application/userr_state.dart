part of 'user_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:td/entities/user.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  const UserLoadingState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserComplete extends UserState {
  final List<User> users;
  const UserComplete(this.users);
}

class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);
}
