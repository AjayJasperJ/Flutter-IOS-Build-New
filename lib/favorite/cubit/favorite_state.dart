part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

abstract class FavoriteActionState extends FavoriteState {}

class FavLoadedSuccessActionState extends FavoriteActionState {}
