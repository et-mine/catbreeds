part of 'cats_bloc.dart';

class CatsState extends Equatable {
  final bool loading;
  final String error;
  final List<CatModel> listCats;

  const CatsState(
      {this.loading = false, this.error = '', this.listCats = const []});

  CatsState copyWith(
          {bool? loading, String? error, List<CatModel>? listCats}) =>
      CatsState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          listCats: listCats ?? this.listCats);

  @override
  List<Object> get props => [loading, error, listCats];
}
