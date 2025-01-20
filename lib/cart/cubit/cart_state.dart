part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

abstract class CartActionState extends CartState {}

class CartLoadedSuccessActionState extends CartActionState {}
