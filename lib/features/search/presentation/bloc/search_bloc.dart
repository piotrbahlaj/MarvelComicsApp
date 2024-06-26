import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_comics_app/services/marvel_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MarvelService marvelService;
  SearchBloc(this.marvelService) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }
  void _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    final query = event.query;
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final results = await marvelService.searchComics(query);
      if (results.isEmpty) {
        emit(
          const SearchError(
              'There is no comic book with that name in our library. Check the spelling and try again'),
        );
      } else {
        emit(SearchLoaded(results));
      }
    } catch (e) {
      emit(const SearchError('Failed to load search results'));
    }
  }
}
