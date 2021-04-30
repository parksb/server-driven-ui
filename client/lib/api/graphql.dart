import 'package:graphql/client.dart';

class GraphQL {
  static final _httpLink = HttpLink(
      'http://127.0.0.1:8080/graphql'
  );

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: _httpLink,
  );

  static fetch(String query, Map<String, dynamic> variables) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    final QueryResult result = await GraphQL.client.query(options);
    if (result.hasException) print(result.exception.toString());
    return result.data;
  }
}
