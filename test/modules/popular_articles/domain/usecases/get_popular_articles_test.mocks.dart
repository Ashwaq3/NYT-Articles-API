// Mocks generated by Mockito 5.4.1 from annotations
// in nyt_articles/test/modules/popular_articles/domain/usecases/get_popular_articles_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nyt_articles/core/error/failure.dart' as _i5;
import 'package:nyt_articles/modules/%20popular_articles/domain/entities/popular_articles_entity.dart'
    as _i6;
import 'package:nyt_articles/modules/%20popular_articles/domain/repositories/popular_articles%20_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularArticlesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularArticlesRepository extends _i1.Mock
    implements _i3.PopularArticlesRepository {
  MockPopularArticlesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.PopularArticlesEntity>>
      getPopularArticles(
    String? section,
    String? period,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #getPopularArticles,
              [
                section,
                period,
              ],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, _i6.PopularArticlesEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.PopularArticlesEntity>(
              this,
              Invocation.method(
                #getPopularArticles,
                [
                  section,
                  period,
                ],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i6.PopularArticlesEntity>>);
}
