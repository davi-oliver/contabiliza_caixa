

abstract class SProduct {
  Future findProductAll() async {
    // select all product show all data from product and category
  }

  // get product by id
  Future findProductById(int id) async {
    // select product by id show all data from product and category
  }

  

  // get product by name
  Future findProductByName(String name) async {
    // select product by name show all data from product and category
  }

  // get product by price
  Future findProductByPrice(double price) async {
    // select product by price show all data from product and category
  }

  // get product by price range
  Future findProductByRangePrice(double price1, double price2) async {
    // select product by price range show all data from product and category
  }

  // get product by date
  Future findProductByDate(String date) async {
    // select product by date show all data from product and category
  }

  // get product by date range
  Future findProductByRangeDate(int date1, int date2) async {
    // select product by date range show all data from product and category
  }

  // delete product by id
  Future deleteProductById(int id) async {
    // delete product by id
  }

  // create product
  Future createProduct(Map<String, dynamic> data) async {
    // create product
  }

  // update product
  Future updateProduct(Map<String, dynamic> data) async {
    // update product
  }

  
}