import '../engine_specs.dart';
import '../performace_specs.dart';

class AutoSpecsDto {
  PerformanceSpecs performanceSpecs;
  EngineSpecs engineSpecs;

  AutoSpecsDto() {
    this.performanceSpecs = PerformanceSpecs();
    this.engineSpecs = EngineSpecs();
  }
}
