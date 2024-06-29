import 'package:bloc/bloc.dart';

class ExpandableTileCubit extends Cubit<bool> {
  ExpandableTileCubit() : super(false);

  void toggleExpansion() {
    emit(!state);
  }

  void reset() {
    emit(false);
  }
}
