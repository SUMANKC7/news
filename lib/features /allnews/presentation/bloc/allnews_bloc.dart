import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'allnews_event.dart';
part 'allnews_state.dart';

class AllnewsBloc extends Bloc<AllnewsEvent, AllnewsState> {
  AllnewsBloc() : super(AllnewsInitial()) {
    on<AllnewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
