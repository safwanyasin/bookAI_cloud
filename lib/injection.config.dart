// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart' as _i23;
import 'package:book_ai/application/api_input/api_input_cubit.dart' as _i24;
import 'package:book_ai/application/auth/auth_cubit.dart' as _i25;
import 'package:book_ai/application/auth/login/login_cubit.dart' as _i12;
import 'package:book_ai/application/auth/register/register_cubit.dart' as _i15;
import 'package:book_ai/application/book/book_actor/book_actor_cubit.dart'
    as _i26;
import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart'
    as _i28;
import 'package:book_ai/application/book_details/book_details_cubit.dart'
    as _i27;
import 'package:book_ai/application/profile_page/profile_page_cubit.dart'
    as _i13;
import 'package:book_ai/application/reading_list/reading_list_cubit.dart'
    as _i14;
import 'package:book_ai/application/search/advanced_search/advanced_search_cubit.dart'
    as _i22;
import 'package:book_ai/application/search/search_cubit.dart' as _i16;
import 'package:book_ai/application/story/story_actor/story_actor_cubit.dart'
    as _i17;
import 'package:book_ai/application/story/story_watcher/story_watcher_cubit.dart'
    as _i20;
import 'package:book_ai/application/story_history/story_history_cubit.dart'
    as _i19;
import 'package:book_ai/application/wishlist/wishlist_cubit.dart' as _i21;
import 'package:book_ai/domain/api_input/i_api_input_repository.dart' as _i8;
import 'package:book_ai/domain/auth/login/i_login_facade.dart' as _i10;
import 'package:book_ai/domain/book/i_book_repository.dart' as _i9;
import 'package:book_ai/domain/story/i_story_repository.dart' as _i11;
import 'package:book_ai/infrastructure/api_input/api_input_repository.dart'
    as _i3;
import 'package:book_ai/infrastructure/auth/login/cloud_login_facade.dart'
    as _i5;
import 'package:book_ai/infrastructure/book/book_repository.dart' as _i4;
import 'package:book_ai/infrastructure/injectable_module.dart' as _i29;
import 'package:book_ai/infrastructure/story/story_repository.dart' as _i18;
import 'package:dio/dio.dart' as _i6;
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
    gh.lazySingleton<_i3.ApiInputRepository>(() => _i3.ApiInputRepository());
    gh.lazySingleton<_i4.ApiService>(() => injectableModule.apiService);
    gh.lazySingleton<_i4.BookRepository>(
        () => _i4.BookRepository(gh<_i4.ApiService>()));
    gh.lazySingleton<_i5.CloudLoginFacade>(() => _i5.CloudLoginFacade());
    gh.lazySingleton<_i6.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i7.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.lazySingleton<_i8.IApiInputRepository>(
        () => injectableModule.apiInputRepository);
    gh.lazySingleton<_i9.IBookRepository>(
        () => injectableModule.bookRepository);
    gh.lazySingleton<_i10.ILoginFacade>(() => injectableModule.loginFacade);
    gh.lazySingleton<_i11.IStoryRepository>(
        () => injectableModule.storyRepository);
    gh.factory<_i12.LoginCubit>(() => _i12.LoginCubit(gh<_i10.ILoginFacade>()));
    gh.factory<_i13.ProfilePageCubit>(() => _i13.ProfilePageCubit());
    gh.factory<_i14.ReadingListCubit>(
        () => _i14.ReadingListCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i15.RegisterCubit>(
        () => _i15.RegisterCubit(gh<_i10.ILoginFacade>()));
    gh.factory<_i16.SearchCubit>(
        () => _i16.SearchCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i17.StoryActorCubit>(
        () => _i17.StoryActorCubit(gh<_i11.IStoryRepository>()));
    gh.lazySingleton<_i18.StoryApiService>(
        () => injectableModule.storyApiService);
    gh.factory<_i19.StoryHistoryCubit>(
        () => _i19.StoryHistoryCubit(gh<_i11.IStoryRepository>()));
    gh.lazySingleton<_i18.StoryRepository>(
        () => _i18.StoryRepository(gh<_i18.StoryApiService>()));
    gh.factory<_i20.StoryWatcherCubit>(
        () => _i20.StoryWatcherCubit(gh<_i11.IStoryRepository>()));
    gh.factory<_i21.WishlistCubit>(
        () => _i21.WishlistCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i22.AdvancedSearchCubit>(
        () => _i22.AdvancedSearchCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i23.AiGenerateCubit>(
        () => _i23.AiGenerateCubit(gh<_i18.StoryRepository>()));
    gh.factory<_i24.ApiInputCubit>(
        () => _i24.ApiInputCubit(gh<_i8.IApiInputRepository>()));
    gh.factory<_i25.AuthCubit>(() => _i25.AuthCubit(gh<_i10.ILoginFacade>()));
    gh.factory<_i26.BookActorCubit>(
        () => _i26.BookActorCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i27.BookDetailsCubit>(
        () => _i27.BookDetailsCubit(gh<_i9.IBookRepository>()));
    gh.factory<_i28.BookWatcherCubit>(
        () => _i28.BookWatcherCubit(gh<_i9.IBookRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i29.InjectableModule {}
