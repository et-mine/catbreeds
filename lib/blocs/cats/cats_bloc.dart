import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  late CatsRepository catsRepository;

  CatsBloc() : super(const CatsState()) {
    catsRepository = CatsRepositoryImpl();
    on<GetAllCats>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await catsRepository.getAllCats();
        emit(state.copyWith(loading: false, listCats: resp));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (error) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrió un error: $error'));
        }
      }
    });
  }
}
