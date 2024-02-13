// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart' as _i4;
import 'package:book_ai/application/api_input/api_input_cubit.dart' as _i21;
import 'package:book_ai/application/auth/auth_cubit.dart' as _i23;
import 'package:book_ai/application/auth/login/login_cubit.dart' as _i13;
import 'package:book_ai/application/auth/register/register_cubit.dart' as _i15;
import 'package:book_ai/application/book/book_actor/book_actor_cubit.dart'
    as _i24;
import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart'
    as _i27;
import 'package:book_ai/application/book_details/book_details_cubit.dart'
    as _i25;
import 'package:book_ai/application/reading_list/reading_list_cubit.dart'
    as _i14;
import 'package:book_ai/application/search/advanced_search/advanced_search_cubit.dart'
    as _i3;
import 'package:book_ai/application/search/search_cubit.dart' as _i16;
import 'package:book_ai/application/story/story_actor/story_actor_cubit.dart'
    as _i17;
import 'package:book_ai/application/story/story_watcher/story_watcher_cubit.dart'
    as _i19;
import 'package:book_ai/application/wishlist/wishlist_cubit.dart' as _i20;
import 'package:book_ai/domain/api_input/i_api_input_repository.dart' as _i9;
import 'package:book_ai/domain/auth/login/i_login_facade.dart' as _i11;
import 'package:book_ai/domain/book/i_book_repository.dart' as _i10;
import 'package:book_ai/domain/story/i_story_repository.dart' as _i12;
import 'package:book_ai/infrastructure/api_input/api_input_repository.dart'
    as _i22;
import 'package:book_ai/infrastructure/auth/login/firebase_login_facade.dart'
    as _i28;
import 'package:book_ai/infrastructure/book/book_repository.dart' as _i26;
import 'package:book_ai/infrastructure/injectable_module.dart' as _i29;
import 'package:book_ai/infrastructure/story/story_repository.dart' as _i18;
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
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
    gh.lazySingleton<_i5.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i6.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i7.FirebaseFirestore>(
        () => injectableModule.firebaseFirestore);
    gh.lazySingleton<_i8.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.lazySingleton<_i9.IApiInputRepository>(
        () => injectableModule.apiInputRepository);
    gh.lazySingleton<_i10.IBookRepository>(
        () => injectableModule.bookRepository);
    gh.lazySingleton<_i11.ILoginFacade>(() => injectableModule.loginFacade);
    gh.lazySingleton<_i12.IStoryRepository>(
        () => injectableModule.storyRepository);
    gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(gh<_i11.ILoginFacade>()));
    gh.factory<_i14.ReadingListCubit>(
        () => _i14.ReadingListCubit(gh<_i10.IBookRepository>()));
    gh.factory<_i15.RegisterCubit>(
        () => _i15.RegisterCubit(gh<_i11.ILoginFacade>()));
    gh.factory<_i16.SearchCubit>(
        () => _i16.SearchCubit(gh<_i10.IBookRepository>()));
    gh.factory<_i17.StoryActorCubit>(
        () => _i17.StoryActorCubit(gh<_i12.IStoryRepository>()));
    gh.lazySingleton<_i18.StoryRepository>(
        () => _i18.StoryRepository(gh<_i7.FirebaseFirestore>()));
    gh.factory<_i19.StoryWatcherCubit>(
        () => _i19.StoryWatcherCubit(gh<_i12.IStoryRepository>()));
    gh.factory<_i20.WishlistCubit>(
        () => _i20.WishlistCubit(gh<_i10.IBookRepository>()));
    gh.factory<_i21.ApiInputCubit>(
        () => _i21.ApiInputCubit(gh<_i9.IApiInputRepository>()));
    gh.lazySingleton<_i22.ApiInputRepository>(
        () => _i22.ApiInputRepository(gh<_i7.FirebaseFirestore>()));
    gh.factory<_i23.AuthCubit>(() => _i23.AuthCubit(gh<_i11.ILoginFacade>()));
    gh.factory<_i24.BookActorCubit>(
        () => _i24.BookActorCubit(gh<_i10.IBookRepository>()));
    gh.factory<_i25.BookDetailsCubit>(
        () => _i25.BookDetailsCubit(gh<_i10.IBookRepository>()));
    gh.lazySingleton<_i26.BookRepository>(
        () => _i26.BookRepository(gh<_i7.FirebaseFirestore>()));
    gh.factory<_i27.BookWatcherCubit>(
        () => _i27.BookWatcherCubit(gh<_i10.IBookRepository>()));
    gh.lazySingleton<_i28.FirebaseLoginFacade>(() => _i28.FirebaseLoginFacade(
          gh<_i6.FirebaseAuth>(),
          gh<_i8.GoogleSignIn>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i29.InjectableModule {}
