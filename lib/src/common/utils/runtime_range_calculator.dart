class RuntimeRangeCalculator {
  static (int?, int?) getRuntimeRange(int duration) {
    int? minRuntime;
    int? maxRuntime;

    switch (duration) {
      case 0:
        minRuntime = null;
        maxRuntime = null;
        break;
      case 1:
        minRuntime = null;
        maxRuntime = 60;
        break;
      case 2:
        minRuntime = 60;
        maxRuntime = 120;
        break;
      case 3:
        minRuntime = 120;
        maxRuntime = null;
        break;
      default:
        minRuntime = null;
        maxRuntime = null;
    }

    return (minRuntime, maxRuntime);
  }
}
