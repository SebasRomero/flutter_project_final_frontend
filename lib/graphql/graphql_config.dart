import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink("http:localhost:3000");

  GraphQLClient clientToQuery() => GraphQLClient(link: httpLink, cache: GraphQLCache());
}