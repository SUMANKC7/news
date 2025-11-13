import 'package:bloc/bloc.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/data/repository/newsrepository.dart';
import 'package:weatherapp/features%20/category_enum.dart';

part 'allnews_event.dart';
part 'allnews_state.dart';

class AllnewsBloc extends Bloc<AllnewsEvent, AllnewsState> {
  final NewsRepository repository;

  AllnewsBloc(this.repository) : super(AllnewsInitial()) {
    on<FetchNewsEvent>(_onFetchNews);
    on<SearchNewsEvent>(_onDiscoverNews);
  }

  Future<void> _onFetchNews(
    FetchNewsEvent event,
    Emitter<AllnewsState> emit,
  ) async {
    emit(Allnewsloading());
    try {
      final categoryString = _categoryToString(event.category);
      final articles = await repository.fetchNews(category: categoryString);
      emit(Newsloaded(articles: articles));
    } catch (e) {
      emit(NewsError(messege: e.toString()));
    }
  }

  String _categoryToString(Category? category) {
    switch (category) {
      case Category.business:
        return "business";

      case Category.all:
        return "all";
      case Category.sport:
        return "sport";

      case Category.politic:
        return "politic";

      case Category.technology:
        return "technology";

      case Category.health:
        return "health";
      default:
        return "all";
    }
  }

  Future<void> _onDiscoverNews(
    SearchNewsEvent event,
    Emitter<AllnewsState> emit,
  ) async {
    emit(Allnewsloading());
    try {
      final articles = await repository.searchNews(event.query);
      emit(Newsloaded(articles: articles));
    } catch (e) {
      emit(NewsError(messege: e.toString()));
    }
  }
}
