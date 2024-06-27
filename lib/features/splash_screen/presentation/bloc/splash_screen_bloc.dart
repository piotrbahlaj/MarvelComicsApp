import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<LoadSplashScreen>((event, emit) async {
      emit(SplashScreenLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashScreenLoaded());
    });
  }
}
