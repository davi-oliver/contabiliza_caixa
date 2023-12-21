import 'dart:async';
import 'dart:developer'; 

import 'package:supabase/supabase.dart';
 final supabase = SupabaseClient(
        'https://uppiwcwfdgtgcfnmajsj.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVwcGl3Y3dmZGd0Z2Nmbm1hanNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMxMjg2MTEsImV4cCI6MjAxODcwNDYxMX0.DM3lJblrCaFJ743OHVqUud0svuSoA8DQD-AYRetS2fg');
class DBSubaBase {
  late String table;
  

  Future createUser () async {
    // insert table users
    // element > name, email, phone
    await supabase.from('users').insert([
      {
        'name': 'user 1',
        'email': 'dsahkjdsak@gmail.com ',
        'phone': '123456',
      },
    ]);

    // select user
    final resp = await supabase
        .from('users')
        .select()
        .order('name', ascending: true);
    log(name: "resp", resp.toString());
  }

  Future createProduct() async {
    // insert table products
    // element > name, price, quantity, created_at, updated_at
    await supabase.from('product').insert([
      {
        'name': 'Gas de cozinha',
        'price': 110.00,
        'amount': 20,
      },
    ]);

    // select product
    final resp2 = await supabase
        .from('product')
        .select()
        .order('name', ascending: true);
    log(name: "resp2", resp2.toString());
  }

  Future createSale() async {
    // insert table sales 
    // element > product_id , quantity, price, total, user_id, created_at, updated_at
    try {
  // await createProduct();
   
  
  await supabase.from('sale').insert([
    {
      'product_id': 3,
      'quantity': 1,
      'price': 1,
      'total': 1,
      'user_id': 1,
   
    },
  ]);
  
    
  
  // select sale
  final resp3 = await supabase
      .from('sale')
      .select()
      .order('product_id', ascending: true);
  log(name: "resp3", resp3.toString());
} on Exception catch (e) {
  // TODO
  log(name: "error", e.toString());
}



   
  }

  Future<void> main() async {
     

    // query data
    final data = await supabase
        .from('users')
        .select()
        .order('name', ascending: true);
    print(data);

    // insert data
    await supabase.from('users').insert([
      {'name': 'Singapore', 'email': 'daviteste@gmail.com', 'phone': '123456'},
    ]);

        final resp = await supabase
        .from('users')
        .select()
        .order('name', ascending: true);
    log(name: "resp",  resp.toString());

//   // update data
//   await supabase.from('countries').update({'name': 'Singapore'}).eq('id', 1);

//   // delete data
//   await supabase.from('countries').delete().eq('id', 1);

//   // realtime
//   final realtimeChannel = supabase.channel('my_channel');
//   realtimeChannel
//       .onPostgresChanges(
//           event: PostgresChangeEvent.all,
//           schema: 'public',
//           table: 'countries',
//           callback: (payload) {})
//       .subscribe();

//   // remember to remove channel when no longer needed
//   supabase.removeChannel(realtimeChannel);

//   // stream
//   final streamSubscription = supabase
//       .from('countries')
//       .stream(primaryKey: ['id'])
//       .order('name')
//       .limit(10)
//       .listen((snapshot) {
//         print('snapshot: $snapshot');
//       });

//   // remember to remove subscription
//   streamSubscription.cancel();

//   // Upload file to bucket "public"
//   final file = File('example.txt');
//   file.writeAsStringSync('File content');
//   final storageResponse =
//       await supabase.storage.from('public').upload('example.txt', file);
//   print('upload response : $storageResponse');

//   // Get download url
//   final urlResponse =
//       await supabase.storage.from('public').createSignedUrl('example.txt', 60);
//   print('download url : $urlResponse');

//   // Download text file
//   final fileResponse =
//       await supabase.storage.from('public').download('example.txt');
//   print('downloaded file : ${String.fromCharCodes(fileResponse)}');

//   // Delete file
//   final deleteFileResponse =
//       await supabase.storage.from('public').remove(['example.txt']);
//   print('deleted file id : ${deleteFileResponse.first.id}');

//   // Local file cleanup
//   if (file.existsSync()) file.deleteSync();
  }
}
