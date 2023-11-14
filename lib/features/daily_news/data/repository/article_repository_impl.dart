import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    final httpResponse = _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countrQuery,
      category: categoryQuery,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.data);
      
    }
  }
  
}