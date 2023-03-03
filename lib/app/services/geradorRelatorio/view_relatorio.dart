import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services_functions.dart';

class ViewRelatorio extends StatefulWidget {
  const ViewRelatorio({super.key});

  @override
  State<ViewRelatorio> createState() => _ViewRelatorioState();
}

class _ViewRelatorioState extends State<ViewRelatorio> {
  late ServiceStore serviceStore;

  Future _getLocal() async {
    final local = await LocalPath().localEpModificacao;
    if(await local.exists()){
      print("Arquivo existe");
 
 

      serviceStore.setListCountDiario(jsonDecode(await local.readAsString()));
    }else {
      print("Arquivo não existe");
    }
    return local;
  }

  @override
  void didChangeDependencies() {
    // declare provider
    serviceStore = Provider.of<ServiceStore>(context, listen: false);
    _getLocal();
    super.didChangeDependencies();

  }

   
  @override
  Widget build(BuildContext context) {
    // declare mediaquery 
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: Colors.blue,
        child: Column(
         
          children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
            child: Row(
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        'Contabiliza Caixa',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
      
          ),
          ListTile(
      leading: Text(
     "QTDE\n${serviceStore.listaCountDiario[1].quantidade}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
             "Data ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          
          Text(
            "${DateFormat('dd/MM/yyyy').format(DateTime.parse(serviceStore.listaCountDiario[1].dataDia.toString()))}",  
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text( serviceStore.listaCountDiario[1].cliente!),
          SizedBox(height: 4),
          Text('Valor unidade: ${ serviceStore.listaCountDiario[1].valorUnidade}'),
        ],
      ),
      trailing: Text(
        'Preço final: ${serviceStore.listaCountDiario[1].valorTotal}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    )
          
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, int index){
            //         return Container(
            //           width: mediaQuery.width * 0.9,
            //           height: mediaQuery.height * 0.1,
            //           color: Colors.red,
            //           child: Text(serviceStore.listaCountDiario[index].cliente.toString())
            //         )
            //         ;
            //       }, 
            //       itemCount: serviceStore.listaCountDiario.length),
        ]),
      ),
    );
  }
}