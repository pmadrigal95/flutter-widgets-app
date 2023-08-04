import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Provider almacenar un estado

final counterProvider = StateProvider<int>((ref) => 0);
