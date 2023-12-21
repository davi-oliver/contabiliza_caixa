
abstract class SCliente {
  
  // create client 
  Future<List<Map<String, dynamic>>> createClient(Map<String, dynamic> data);

  // update client
  Future<List<Map<String, dynamic>>> updateClient(Map<String, dynamic> data);

  // delete client
  Future<List<Map<String, dynamic>>> deleteClient(Map<String, dynamic> data);

  // find client
  Future<List<Map<String, dynamic>>> findOneClient(Map<String, dynamic> data);

  // find all client
  Future<List<Map<String, dynamic>>> findAllClient();

  // finda by name client
  Future<List<Map<String, dynamic>>> findByNameClient(Map<String, dynamic> data);


}