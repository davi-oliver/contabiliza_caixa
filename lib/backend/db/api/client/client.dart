
abstract class SCompanies {
  
  // create client 
  Future<List<Map<String, dynamic>>> createCompany(Map<String, dynamic> data);

  // update client
  Future<List<Map<String, dynamic>>> updateCompany(Map<String, dynamic> data);

  // delete client
  Future<List<Map<String, dynamic>>> deleteCompany(Map<String, dynamic> data);

  // find client
  Future<List<Map<String, dynamic>>> findOneCompany(Map<String, dynamic> data);

  // find all client
  Future<List<Map<String, dynamic>>> findAllCompany();

  // finda by name client
  Future<List<Map<String, dynamic>>> findByNameCompany(Map<String, dynamic> data);


}