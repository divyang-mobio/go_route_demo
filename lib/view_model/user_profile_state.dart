part of 'user_profile_bloc.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  Welcome data;

  UserProfileLoaded({required this.data});
}

class UserProfileError extends UserProfileState {}
