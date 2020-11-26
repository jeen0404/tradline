import 'package:bloc/bloc.dart';
import 'package:tradline/cache/init_hive.dart';
import 'package:tradline/repository/i_am_repository.dart';

/// app start event
enum AppStartCubitEvent {
  AppStartedAppStartCubitEvent ,// event when app is start
  AuthAppStartCubitEvent ,// event when user enter and proceed
}

// app start states
enum AppStartCubitState {
  InitlizingAppStartCubitState, //   show splash screen to user and load databases

  AuthenticatedAppStartCubitState,

  /// user is authenticated and show main_screen

  UnAuthenticatedAppStartCubitState // user not authenticated so ask for name // send user to ask_name_screen

}

class AppStartCubit extends Bloc<AppStartCubitEvent, AppStartCubitState> {
  AppStartCubit() : super(AppStartCubitState.InitlizingAppStartCubitState);

  ///retuen  initilize state

  @override
  Stream<AppStartCubitState> mapEventToState(AppStartCubitEvent event) async* {
    // load database
    if(event==AppStartCubitEvent.AppStartedAppStartCubitEvent){
    await InitHive().init();

    // just for animation purpose
    await Future.delayed(Duration(seconds: 1));
    if (NameRepository().get() != null) {
      yield AppStartCubitState.AuthenticatedAppStartCubitState;
    } else {
      yield AppStartCubitState.UnAuthenticatedAppStartCubitState;
    }
    }
    else{
      if (NameRepository().get() != null) {
        yield AppStartCubitState.AuthenticatedAppStartCubitState;
      } else {
        yield AppStartCubitState.UnAuthenticatedAppStartCubitState;
      }
    }
  }
}
