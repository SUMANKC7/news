import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/data/repository/newsrepository.dart';

part 'allnews_event.dart';
part 'allnews_state.dart';

// class AllnewsBloc extends Bloc<AllnewsEvent, AllnewsState> {
//   AllnewsBloc() : super(AllnewsInitial()) {
//     on<AllnewsEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class AllnewsBloc extends Bloc<AllnewsEvent, AllnewsState> {
  final NewsRepository repository;

  AllnewsBloc(this.repository) : super(AllnewsInitial()) {
    on<FetchNewsEvent>(_onFetchNews);
  }

  Future<void> _onFetchNews(
    FetchNewsEvent event,
    Emitter<AllnewsState> emit,
  ) async {
    emit(Allnewsloading());
    try {
      final articles = await repository.fetchNews(category: event.category);
      emit(Newsloaded(articles: articles));
    } catch (e) {
      emit(NewsError(messege: e.toString()));
    }
  }
}
