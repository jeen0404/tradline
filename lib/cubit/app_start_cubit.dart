import 'package:bloc/bloc.dart';
import 'package:tradline/cache/init_hive.dart';

/// app start event
enum AppStartCubitEvent {
  AppStartedAppStartCubitEvent // event when app is start
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
    await InitHive().init();
    await Future.delayed(Duration(seconds: 2));
    yield AppStartCubitState.AuthenticatedAppStartCubitState;
  }
}
