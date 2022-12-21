import 'package:bloc/bloc.dart';
import '../model/data_model.dart';
import '../repositary/http_calling.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  HttpServices httpServices;

  UserProfileBloc({required this.httpServices}) : super(UserProfileInitial()) {
    on<GetData>((event, emit) async {
      emit(UserProfileInitial());
      try {
        Welcome data =
            await httpServices.getCall('https://reqres.in/api/users?page=1');
        emit(UserProfileLoaded(data: data));
      } catch (e) {
        emit(UserProfileError());
      }
    });
  }
}
