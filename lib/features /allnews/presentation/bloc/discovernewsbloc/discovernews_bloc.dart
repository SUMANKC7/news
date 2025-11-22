import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/features%20/allnews/data/model/allnews_model.dart';
import 'package:weatherapp/features%20/allnews/data/repository/newsrepository.dart';
import 'package:weatherapp/features%20/category_enum.dart';

part 'discovernews_event.dart';
part 'discovernews_state.dart';

class DiscovernewsBloc extends Bloc<DiscovernewsEvent, DiscovernewsState> {
  final NewsRepository repository;
  DiscovernewsBloc(this.repository) : super(DiscovernewsInitial()) {
    on<FetchCategoryNewsEvent>(_onFetchCategoryNews);
  }

  Future<void> _onFetchCategoryNews(
    FetchCategoryNewsEvent event,
    Emitter<DiscovernewsState> emit,
  ) async {
    emit(DiscoverNewsloading());
    try {
      final categoryString = _categoryToString(event.category);
      final articles = await repository.discoverNews(categoryString);
      emit(CategoryNewsLoaded(categorynewsarticles: articles));
    } catch (e) {
      emit(DiscoverNewsError(messege: e.toString()));
    }
  }

  String _categoryToString(Category? category) {
    switch (category) {
      case Category.business:
        return "business";

      case Category.general:
        return "general";
      case Category.sports:
        return "sport";

      case Category.politics:
        return "politics";

      case Category.technology:
        return "technology";

      case Category.health:
        return "health";
      case Category.science:
        return "science";
      case Category.entertainment:
        return "entertainment";
      default:
        return "general";
    }
  }
}
