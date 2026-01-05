// A simple BlocObserver that logs Bloc lifecycle events to the console.
// هو كلاس بيرث من BlocObserver وبيوفر طريقة سهلة لمراقبة lifecycle events لل Bloc او Cubit في الابلكيشن
// بنستخدمه عشان نتابع التغيرات اللي بتحصل في ال Bloc او Cubit زي انشاء Bloc جديد، تغير الحالة، او اغلاق Bloc
// بنقدر نستخدمه في مرحلة التطوير (development) عشان نعرف ايه اللي بيحصل في ال Bloc او Cubit بتاعنا
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// خليناه implement BlocObserver عشان يجبرنا نكتب الدوال اللي موجودة في BlocObserver
class SimpleBlocObserver implements BlocObserver {
  // اللي يهمنا هتستخدمه هنا هي دالة onChange عشان نتابع التغيرات اللي بتحصل في ال Bloc او Cubit
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // الفرق بين print و debugPrint:
    // print: بتطبع الرسالة في الكونسول، لكن لو الرسالة طويلة ممكن تتقطع ومش هتظهر كاملة
    // debugPrint: بتطبع الرسالة في الكونسول، وبتقسم الرسالة لو كانت طويلة عشان تظهر كاملة
    // print: دي بتفضل موجودة في الابلكيشن حتى في ال release mode لما اجي اعمل نسخة للابلكيشن عشان انشرها ودا شيء مش كويس عشان ممكن تكشف معلومات حساسةومهمة مينفعش تظهر
    // debugPrint: دي بتختفي في ال release mode لما اعمل نسخة للابلكيشن 
    debugPrint('Change -- ${bloc.runtimeType} => $change');
  }
  // وكدا خلصناها فهنروح علي ال main.dart عشان نستخدمها هناك عن طريق
  // بنسجل ال BlocObserver بتاعنا
  // Bloc.observer = SimpleBlocObserver();


  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint('Close -- ${bloc.runtimeType} => $bloc');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint('Create -- ${bloc.runtimeType} => $bloc');
  }

  @override
  void onDone(Bloc<dynamic, dynamic> bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    debugPrint('Done -- ${bloc.runtimeType} => $event,/ error: $error,/ stackTrace: $stackTrace');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error -- ${bloc.runtimeType} => $error');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    debugPrint('Event -- ${bloc.runtimeType} => $event');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    debugPrint('Transition -- ${bloc.runtimeType} => $transition');
  }
}