// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_ai/application/auth/auth_cubit.dart' as _i11;
import 'package:book_ai/application/auth/login/login_cubit.dart' as _i8;
import 'package:book_ai/application/auth/register/register_cubit.dart' as _i10;
import 'package:book_ai/application/book/book_actor/book_actor_cubit.dart'
    as _i9;
import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart'
    as _i13;
import 'package:book_ai/domain/auth/login/i_login_facade.dart' as _i7;
import 'package:book_ai/domain/book/i_book_repository.dart' as _i6;
import 'package:book_ai/infrastructure/auth/login/firebase_login_facade.dart'
    as _i14;
import 'package:book_ai/infrastructure/book/book_repository.dart' as _i12;
import 'package:book_ai/infrastructure/injectable_module.dart' as _i15;
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
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
    gh.lazySingleton<_i3.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => injectableModule.firebaseFirestore);
    gh.lazySingleton<_i5.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.lazySingleton<_i6.IBookRepository>(
        () => injectableModule.bookRepository);
    gh.lazySingleton<_i7.ILoginFacade>(() => injectableModule.loginFacade);
    gh.factory<_i8.LoginCubit>(() => _i8.LoginCubit(gh<_i7.ILoginFacade>()));
    gh.factory<_i9.NoteActorCubit>(
        () => _i9.NoteActorCubit(gh<_i6.IBookRepository>()));
    gh.factory<_i10.RegisterCubit>(
        () => _i10.RegisterCubit(gh<_i7.ILoginFacade>()));
    gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(gh<_i7.ILoginFacade>()));
    gh.lazySingleton<_i12.BookRepository>(
        () => _i12.BookRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i13.BookWatcherCubit>(
        () => _i13.BookWatcherCubit(gh<_i6.IBookRepository>()));
    gh.lazySingleton<_i14.FirebaseLoginFacade>(() => _i14.FirebaseLoginFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.GoogleSignIn>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i15.InjectableModule {}
