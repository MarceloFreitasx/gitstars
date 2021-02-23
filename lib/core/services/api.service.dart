import 'package:gitstars/core/config.dart';
import 'package:gitstars/core/routes/routes.dart';
import 'package:graphql/client.dart';

abstract class IApi {
  Future<Map<String, dynamic>> call(String data);
}

enum EApiType { post, put, patch, delete }

class ApiService implements IApi {
  ApiService({this.apiRoute}) {
    _httpLink = HttpLink(apiRoute ?? ApiRoutes.baseUrl);
    _authLink = AuthLink(
      getToken: () async => 'Bearer ${AppConfig.TOKEN}',
    );
    _link = _authLink.concat(_httpLink);
    client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: _link,
    );
  }

  final String apiRoute;
  HttpLink _httpLink;
  AuthLink _authLink;
  Link _link;
  GraphQLClient client;

  Future<Map<String, dynamic>> call(String data) async {
    final QueryOptions options = QueryOptions(
      document: gql(data),
      variables: <String, dynamic>{
        'query': data,
      },
    );
    final QueryResult response = await client.query(options);

    print("======start======");
    print("url: ${_httpLink.uri.toString()}");
    print("query: $data");
    print("responseData: ${response.data}");
    print("=======end=======");

    return response.data;
  }
}
