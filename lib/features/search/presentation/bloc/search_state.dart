part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<dynamic> comics;

  const SearchLoaded(this.comics);
  @override
  List<Object> get props => [comics];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);
  @override
  List<Object> get props => [message];
}
