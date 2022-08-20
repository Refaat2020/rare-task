
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/view_model/home_view_model.dart';
import 'package:rare_task/view_model/login_view_model.dart';
import 'package:rare_task/view_model/main_view_model.dart';

import '../view_model/login_state.dart';

final loginProvider = StateNotifierProvider<LoginViewModel,LoginState>((ref) => LoginViewModel());
final mainScreenProvider = ChangeNotifierProvider<MainViewModel>((ref) => MainViewModel());
final homeProvider = ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel());