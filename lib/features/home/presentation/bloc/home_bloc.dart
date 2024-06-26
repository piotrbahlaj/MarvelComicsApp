import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_comics_app/services/marvel_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MarvelService marvelService;
  HomeBloc(this.marvelService) : super(HomeInitial()) {
    on<FetchComics>(_onFetchComics);
  }
  Future<void> _onFetchComics(
      FetchComics event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final data = await marvelService.fetchComics();
      final comics = data['data']['results'];
      emit(HomeLoaded(comics.cast<Map<String, dynamic>>()));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
