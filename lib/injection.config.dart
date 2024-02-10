// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_ai/application/advanced_search/advanced_search_cubit.dart'
    as _i3;
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart' as _i4;
import 'package:book_ai/application/auth/auth_cubit.dart' as _i16;
import 'package:book_ai/application/auth/login/login_cubit.dart' as _i11;
import 'package:book_ai/application/auth/register/register_cubit.dart' as _i12;
import 'package:book_ai/application/book/book_actor/book_actor_cubit.dart'
    as _i17;
import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart'
    as _i19;
import 'package:book_ai/application/story/story_actor/story_actor_cubit.dart'
    as _i13;
import 'package:book_ai/application/story/story_watcher/story_watcher_cubit.dart'
    as _i15;
import 'package:book_ai/domain/auth/login/i_login_facade.dart' as _i9;
import 'package:book_ai/domain/book/i_book_repository.dart' as _i8;
import 'package:book_ai/domain/story/i_story_repository.dart' as _i10;
import 'package:book_ai/infrastructure/auth/login/firebase_login_facade.dart'
    as _i20;
import 'package:book_ai/infrastructure/book/book_repository.dart' as _i18;
import 'package:book_ai/infrastructure/injectable_module.dart' as _i21;
import 'package:book_ai/infrastructure/story/story_repository.dart' as _i14;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.AdvancedSearchCubit>(() => _i3.AdvancedSearchCubit());
    gh.factory<_i4.AiGenerateCubit>(() => _i4.AiGenerateCubit());
    gh.lazySingleton<_i5.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => injectableModule.firebaseFirestore);
    gh.lazySingleton<_i7.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.lazySingleton<_i8.IBookRepository>(
        () => injectableModule.bookRepository);
    gh.lazySingleton<_i9.ILoginFacade>(() => injectableModule.loginFacade);
    gh.lazySingleton<_i10.IStoryRepository>(
        () => injectableModule.storyRepository);
    gh.factory<_i11.LoginCubit>(() => _i11.LoginCubit(gh<_i9.ILoginFacade>()));
    gh.factory<_i12.RegisterCubit>(
        () => _i12.RegisterCubit(gh<_i9.ILoginFacade>()));
    gh.factory<_i13.StoryActorCubit>(
        () => _i13.StoryActorCubit(gh<_i10.IStoryRepository>()));
    gh.lazySingleton<_i14.StoryRepository>(
        () => _i14.StoryRepository(gh<_i6.FirebaseFirestore>()));
    gh.factory<_i15.StoryWatcherCubit>(
        () => _i15.StoryWatcherCubit(gh<_i10.IStoryRepository>()));
    gh.factory<_i16.AuthCubit>(() => _i16.AuthCubit(gh<_i9.ILoginFacade>()));
    gh.factory<_i17.BookActorCubit>(
        () => _i17.BookActorCubit(gh<_i8.IBookRepository>()));
    gh.lazySingleton<_i18.BookRepository>(
        () => _i18.BookRepository(gh<_i6.FirebaseFirestore>()));
    gh.factory<_i19.BookWatcherCubit>(
        () => _i19.BookWatcherCubit(gh<_i8.IBookRepository>()));
    gh.lazySingleton<_i20.FirebaseLoginFacade>(() => _i20.FirebaseLoginFacade(
          gh<_i5.FirebaseAuth>(),
          gh<_i7.GoogleSignIn>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i21.InjectableModule {}
