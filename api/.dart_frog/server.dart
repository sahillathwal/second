// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/api/v1/users/me.dart' as api_v1_users_me;
import '../routes/api/v1/subscriptions/index.dart' as api_v1_subscriptions_index;
import '../routes/api/v1/search/relevant.dart' as api_v1_search_relevant;
import '../routes/api/v1/search/popular.dart' as api_v1_search_popular;
import '../routes/api/v1/newsletter/subscription.dart' as api_v1_newsletter_subscription;
import '../routes/api/v1/feed/index.dart' as api_v1_feed_index;
import '../routes/api/v1/categories/index.dart' as api_v1_categories_index;
import '../routes/api/v1/articles/[id]/related.dart' as api_v1_articles_$id_related;
import '../routes/api/v1/articles/[id]/index.dart' as api_v1_articles_$id_index;

import '../routes/_middleware.dart' as middleware;

void main() async {
  final address = InternetAddress.tryParse('0.0.0.0') ?? InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '80') ?? 80;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/api/v1/articles/<id>', (context,id,) => buildApiV1Articles$idHandler(id,)(context))
    ..mount('/api/v1/categories', (context) => buildApiV1CategoriesHandler()(context))
    ..mount('/api/v1/feed', (context) => buildApiV1FeedHandler()(context))
    ..mount('/api/v1/newsletter', (context) => buildApiV1NewsletterHandler()(context))
    ..mount('/api/v1/search', (context) => buildApiV1SearchHandler()(context))
    ..mount('/api/v1/subscriptions', (context) => buildApiV1SubscriptionsHandler()(context))
    ..mount('/api/v1/users', (context) => buildApiV1UsersHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildApiV1Articles$idHandler(String id,) {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/related', (context) => api_v1_articles_$id_related.onRequest(context,id,))..all('/', (context) => api_v1_articles_$id_index.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildApiV1CategoriesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_v1_categories_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1FeedHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_v1_feed_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1NewsletterHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/subscription', (context) => api_v1_newsletter_subscription.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1SearchHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/relevant', (context) => api_v1_search_relevant.onRequest(context,))..all('/popular', (context) => api_v1_search_popular.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1SubscriptionsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_v1_subscriptions_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1UsersHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/me', (context) => api_v1_users_me.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}

