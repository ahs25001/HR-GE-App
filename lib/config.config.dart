// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/cache/image_picker.dart' as _i3;
import 'fetures/reliability/data/data_sources/local_ds/reliability_local_ds.dart'
    as _i4;
import 'fetures/reliability/data/data_sources/local_ds/reliability_local_ds_impl.dart'
    as _i5;
import 'fetures/reliability/data/repositories/reliability_repo_impl.dart'
    as _i7;
import 'fetures/reliability/domain/repositories/reliability_repo.dart' as _i6;
import 'fetures/reliability/domain/use_cases/get_image_from_camera_usecase.dart'
    as _i8;
import 'fetures/reliability/presentation/bloc/reliability_bloc.dart' as _i9;

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
    gh.singleton<_i3.ImagePickerManager>(() => _i3.ImagePickerManager());
    gh.factory<_i4.ReliabilityLocalDs>(
        () => _i5.ReliabilityLocalDsImpl(gh<_i3.ImagePickerManager>()));
    gh.factory<_i6.ReliabilityRepo>(
        () => _i7.ReliabilityRepoImpl(gh<_i4.ReliabilityLocalDs>()));
    gh.factory<_i8.GetImageFromCameraUseCase>(
        () => _i8.GetImageFromCameraUseCase(gh<_i6.ReliabilityRepo>()));
    gh.factory<_i9.ReliabilityBloc>(
        () => _i9.ReliabilityBloc(gh<_i8.GetImageFromCameraUseCase>()));
    return this;
  }
}
