abstract class HostRepository{
  Future<void> addNewHost();
  Future<void> updateHost();
  Future<void> deleteHost();
  Future<void> getHost();
}