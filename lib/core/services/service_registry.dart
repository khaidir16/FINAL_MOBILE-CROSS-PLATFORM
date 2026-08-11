abstract final class ServiceRegistry {
  const ServiceRegistry._();

  /// Firebase is intentionally left disabled in Phase 1.
  /// It will be initialized during the backend integration phase.
  static const bool isFirebaseConfigured = false;
}
