import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<Map<int, bool>> {
  HomeCubit() : super({});

  void toggleHeartIcon(int productId) {
    final Map<int, bool> currentState = state;
    final bool isLiked = currentState.containsKey(productId) ? currentState[productId]! : false;
    emit(Map.from(currentState)..[productId] = !isLiked);
  }

  void togglePlusIcon(int productId) {
    final Map<int, bool> currentState = state;
    final bool isPlusIconSelected = currentState.containsKey(productId) ? currentState[productId]! : false;
    emit(Map.from(currentState)..[productId] = !isPlusIconSelected);
  }



}
