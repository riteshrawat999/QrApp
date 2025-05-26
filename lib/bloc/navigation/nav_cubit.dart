import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { scanner, generator, history, settings }

class NavState {
  final NavigationItem selectedItem;

  NavState({required this.selectedItem});
}

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState(selectedItem: NavigationItem.scanner));

  void selectedItem(NavigationItem item) {
    emit(NavState(selectedItem: item));
  }
}
