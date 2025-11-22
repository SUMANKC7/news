import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/data/repository/newsrepository.dart';

part 'searchnewsbloc_event.dart';
part 'searchnewsbloc_state.dart';

class SearchnewsblocBloc extends Bloc<SearchnewsblocEvent, SearchnewsblocState> {
   final NewsRepository repository;

  SearchnewsblocBloc(this.repository) : super(SearchnewsblocInitial()) {
     on<SearchNewsEvent>(_onDiscoverNews);
  }

    Future<void> _onDiscoverNews(
    SearchNewsEvent event,
    Emitter<SearchnewsblocState> emit,
  ) async {
    emit(SearchNewsloading());
    try {
      final articles = await repository.searchNews(event.query);
      emit(SearchNewsLoaded(searchnewsarticles: articles,));
    } catch (e) {
      emit(SearchNewserror(messege: e.toString()));
    }
  }
}
