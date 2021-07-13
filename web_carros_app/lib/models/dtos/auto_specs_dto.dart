import 'package:web_carros_app/models/transmission_specs.dart';

import '../dimensions_specs.dart';
import '../performace_specs.dart';
import '../aditional_specs.dart';
import '../engine_specs.dart';

class AutoSpecsDto {
  PerformanceSpecs performanceSpecs;
  EngineSpecs engineSpecs;
  TransmissionSpecs transmissionSpecs;
  DimensionsSpecs dimensionsSpecs;
  AditionalSpecs aditionalSpecs;

  AutoSpecsDto() {}
}
