// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:personnel_management/common/theme/theme.dart';
//
// part 'theme_event.dart';
//
// part 'theme_state.dart';
//
// part 'theme_bloc.freezed.dart';
//
// @injectable
// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeState.initial(DarkTheme())) {
//     on<ThemeEvent>(
//       (event, emit) {
//         event.map(
//           themeChanged: (_) => _themeChanged(_, emit),
//         );
//       },
//     );
//   }
//
//   void _themeChanged(
//     _ThemeChanged event,
//     Emitter<ThemeState> emit,
//   ) {
//     if (event.isDark) {
//       emit(ThemeState.themeState(DarkTheme()));
//     } else {
//       emit(ThemeState.themeState(LightTheme()));
//     }
//   }
// }
