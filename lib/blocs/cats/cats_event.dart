part of 'cats_bloc.dart';

sealed class CatsEvent extends Equatable {
  const CatsEvent();

  @override
  List<Object> get props => [];
}

class GetAllCats extends CatsEvent {}
