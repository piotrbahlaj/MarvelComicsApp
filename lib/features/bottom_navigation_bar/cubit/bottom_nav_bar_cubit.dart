import 'package:bloc/bloc.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);

  void updateIndex(int newIndex) {
    emit(newIndex);
  }
}
