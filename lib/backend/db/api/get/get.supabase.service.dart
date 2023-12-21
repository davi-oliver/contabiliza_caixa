import 'dart:developer';

import 'package:ga_proj/backend/db.supabase.dart';
import 'package:ga_proj/backend/db/api/product/product.controller.dart';
import 'package:ga_proj/backend/db/api/sale/sale.controller.dart';
import 'package:ga_proj/backend/db/api/users/users.controller.dart';

class GetSupaBaseApi implements SSale, SProduct, SUsers {
  @override
  Future findSaleAll() async {
    // select all sale show all data from sale, product and user
    final resp4 = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .order('id', ascending: true);
    log(name: "GET SALE", resp4.toString());
  }

  @override

  // get sale by id
  Future findSaleById(int id) async {
    final resp = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .eq('id', id);
    log(name: "GET SALE BY ID", resp.toString());
  }

  @override

  // get sale by user id
  Future findSaleByUserId(int id) async {
    final resp = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .eq('user_id', id);
    log(name: "GET SALE BY USER ID", resp.toString());
  }

  @override

  // get sale by product id
  Future findSaleByProductId(int id) async {
    final resp = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .eq('product_id', id);
    log(name: "GET SALE BY PRODUCT ID", resp.toString());
  }

  @override

  // get sale by date
  Future findSaleByDate(String date) async {
    final resp = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .eq('created_at', date);
    log(name: "GET SALE BY DATE", resp.toString());
  }

  @override

  // get sale by date range
  Future findSaleByRangeDate(int date1, int date2) async {
    final resp = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .range(date1, date2, referencedTable: 'created_at');
    log(name: "GET SALE BY DATE RANGE", resp.toString());
  }

  @override
  Future createProduct(Map<String, dynamic> data) async {
    // create product :
    final resp = await supabase.from('product').insert([
      {
        'name': data['name'],
        'price': data['price'],
        'amount': data['amount'],
      },
    ]);
    log(name: "CREATE PRODUCT", resp.toString());
  }

  @override
  Future createSale(Map<String, dynamic> data) async {
    // create sale : user_id, product_id, quantity, price, total, created_at, updated_at, payment_type
    final resp = await supabase.from('sale').insert([
      {
        'user_id': data['user_id'],
        'product_id': data['product_id'],
        'quantity': data['quantity'],
        'price': data['price'],
        'total': data['total'],
        'payment_type': data['payment_type'],
      },
    ]);
    log(name: "CREATE SALE", resp.toString());
  }

  @override
  Future createUsers(Map<String, dynamic> data)async {
    // create user : name, phone, email
    final resp = await supabase.from('users').insert([
      {
        'name': data['name'],
        'phone': data['phone'],
        'email': data['email'],
      },
    ]);
    log(name: "CREATE USERS", resp.toString());
  }

  @override
  Future deleteProductById(int id) async {
    // delete product by id
    final resp = await supabase.from('product').delete().eq('id', id);
    log(name: "DELETE PRODUCT BY ID", resp.toString());
  }

  @override
  Future deleteSaleById(int id) async {
    // delete sale by id
    final resp = await supabase.from('sale').delete().eq('id', id);
    log(name: "DELETE SALE BY ID", resp.toString());
  }

  @override
  Future deleteUsersById(int id) async {
    // delete users by id
    final resp = await supabase.from('users').delete().eq('id', id);
    log(name: "DELETE USERS BY ID", resp.toString());
  }

  @override
  Future findProductAll() async {
    // select all product show all data from product
    final resp = await supabase.from('product').select().order('id', ascending: true);
    log(name: "GET PRODUCT", resp.toString());
  }

  @override
  Future findProductByDate(String date) async {
    // select product by date show all data from product
    final resp = await supabase.from('product').select().eq('created_at', date);
    log(name: "GET PRODUCT BY DATE", resp.toString());
  }

  @override
  Future findProductById(int id) async {
    final resp = await supabase.from('product').select().eq('id', id);
    log(name: "GET PRODUCT BY ID", resp.toString());
  }

  @override
  Future findProductByName(String name) async {
    final resp = await supabase.from('product').select().eq('name', name);
    log(name: "GET PRODUCT BY NAME", resp.toString());
  }

  @override
  Future findProductByPrice(double price) async {
    final resp = await supabase.from('product').select().eq('price', price);
    log(name: "GET PRODUCT BY PRICE", resp.toString());
  }

  @override
  Future findProductByRangeDate(int date1, int date2) async {
    final resp = await supabase
        .from('product')
        .select()
        .range(date1, date2, referencedTable: 'created_at');
    log(name: "GET PRODUCT BY DATE RANGE", resp.toString());
  }

  @override
  Future findProductByRangePrice(double price1, double price2) async {
    final resp = await supabase
        .from('product')
        .select()
        .range(price1.round(), price2.round(), referencedTable: 'price');
    log(name: "GET PRODUCT BY PRICE RANGE", resp.toString());
  }

  @override
  Future findUsersAll() async {
    final resp = await supabase.from('users').select().order('id', ascending: true);
    log(name: "GET USERS", resp.toString());
  }

  @override
  Future findUsersByAddress(String address) async {
    final resp = await supabase.from('users').select().eq('address', address);
    log(name: "GET USERS BY ADDRESS", resp.toString());
  }

  @override
  Future findUsersByDate(String date) async {
    // implement findUsersByDate
    final resp = await supabase.from('users').select().eq('created_at', date);
    log(name: "GET USERS BY DATE", resp.toString());
  }

  @override
  Future findUsersByEmail(String email) async {
 
    final resp = await supabase.from('users').select().eq('email', email);
    log(name: "GET USERS BY EMAIL", resp.toString());
  }

  @override
  Future findUsersById(int id) async {
 
    final resp = await supabase.from('users').select().eq('id', id);
    log(name: "GET USERS BY ID", resp.toString());
  }

  @override
  Future findUsersByName(String name) async {
    final resp = await supabase.from('users').select().eq('name', name);
    log(name: "GET USERS BY NAME", resp.toString());
  }

  @override
  Future findUsersByPhone(String phone) async {
    final resp = await supabase.from('users').select().eq('phone', phone);
    log(name: "GET USERS BY PHONE", resp.toString());
  }

  @override
  Future findUsersByRangeDate(int date1, int date2) async {
    final resp = await supabase
        .from('users')
        .select()
        .range(date1, date2, referencedTable: 'created_at');
    log(name: "GET USERS BY DATE RANGE", resp.toString());
  }

  @override
  Future updateProduct(Map<String, dynamic> data) async {
    final resp = await supabase.from('product').update({
      'name': data['name'],
      'price': data['price'],
      'amount': data['amount'],
    }).eq('id', data['id']);
  }

  @override
  Future updateSale(Map<String, dynamic> data) async {
    final resp = await supabase.from('sale').update({
      'user_id': data['user_id'],
      'product_id': data['product_id'],
      'quantity': data['quantity'],
      'price': data['price'],
      'total': data['total'],
      'payment_type': data['payment_type'],
    }).eq('id', data['id']);

    // select sale by id show all data from sale, product and user
    final resp2 = await supabase
        .from('sale')
        .select('*,product(*),users(*)')
        .eq('id', data['id']);
  }

  @override
  Future updateUsers(Map<String, dynamic> data) async {
    final resp = await supabase.from('users').update({
      'name': data['name'],
      'phone': data['phone'],
      'email': data['email'],
    }).eq('id', data['id']);

    // select users by id show all data from users
    final resp2 = await supabase.from('users').select().eq('id', data['id']);

    log(name: "UPDATE USERS", resp2.toString());
  }
  
 
}
